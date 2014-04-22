require 'fileutils'
require 'json'
require 'rubygems'
require 'tempfile'

cookie = "<session cookie from the browser>"
csrf_token = "<csrf token from the browser>"
json_file_path = ARGV[0]
json_file_name = ARGV[1] + ".txt"
username = "<username>"
password = "<password>"
card_data = JSON.parse(File.read json_file_path)
image_for_card = JSON.parse(File.read "card_to_image.json")
image_filename = image_for_card[card_data["card_number"]]
image_size = File.size("mingle_attachments/#{image_filename}")
path_to = "issues_dir/modified_json_files"

begin
  if !image_filename.nil?
    system("curl -X POST -H 'Cookie: #{cookie}'"+
               " -H 'X-CSRF-Token: #{csrf_token}'"+
               " -d 'name=#{image_filename}'"+
               " -d 'size=#{image_size}'"+
               " -d 'content_type=image/png'"+
               " 'https://github.com/upload/policies/assets' > assets_upload_policies")

    assets_upload_policies_text = File.new("assets_upload_policies").read
    assets_upload_policies_json = JSON.parse(assets_upload_policies_text)

    system("curl -F \"key=#{assets_upload_policies_json["form"]["key"]}\""+
               " -F \"AWSAccessKeyId=#{assets_upload_policies_json["form"]["AWSAccessKeyId"]}\""+
               " -F \"acl=public-read\" -F \"policy=#{assets_upload_policies_json["form"]["policy"]}\""+
               " -F \"signature=#{assets_upload_policies_json["form"]["signature"]}\""+
               " -F \"Content-Type=image/png\""+
               " -F \"Cache-Control=#{assets_upload_policies_json["form"]["Cache-Control"]}\""+
               " -F \"x-amz-meta-Surrogate-Control=#{assets_upload_policies_json["form"]["x-amz-meta-Surrogate-Control"]}\""+
               " -F \"x-amz-meta-Surrogate-Key=#{assets_upload_policies_json["form"]["x-amz-meta-Surrogate-Key"]}\""+
               " -F \"file=@#{"mingle_attachments/#{image_filename}"}; filename=#{image_filename}; type=image/png\""+
               " https://s3.amazonaws.com/github-cloud")

    system("curl -X PUT -H 'Cookie: #{cookie}'"+
               " -H 'X-CSRF-Token: #{csrf_token}'"+
               " -d 'name=#{image_filename}'"+
               " -d 'size=#{image_size}'"+
               " -d 'content_type=image/png'"+
               " -d 'href=#{assets_upload_policies_json["asset"]["href"]}'"+
               " https://github.com#{assets_upload_policies_json["asset_upload_url"]} > upload_assets_response")

    upload_assets_response_text = File.new("upload_assets_response").read
    upload_assets_response_json = JSON.parse(upload_assets_response_text)
  end


  begin
    temp_file=Tempfile.new('modified_json_file')
    card_data.delete "card_number"
    if !image_filename.nil?
      card_data["body"] += "\n \n ![#{image_filename}](#{upload_assets_response_json["href"]})"
    end
    temp_file.write(card_data.to_json)
    FileUtils.mv(temp_file.path, path_to + "/" + json_file_name)
  ensure
    temp_file.close
    temp_file.unlink
  end

  file_to_be_uploaded = path_to + "/" + json_file_name
  system(%Q{curl -u "#{username}:#{password}" -X POST -d @#{file_to_be_uploaded} https://api.github.com/repos/GoCD/GoCD/issues})
#ensure
#  assets_upload_policies_text.close
#  upload_assets_response_text.close
#  assets_upload_policies_text.unlink
#  upload_assets_response_text.unlink
end

