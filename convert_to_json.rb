require 'fileutils'
require 'json'
require 'tempfile'

filename = ARGV[0]
filename_to = ARGV[1]
text = File.new(filename).read
fields = text.split('@@')
labels = Array.new
path_to = "issues_dir/json_files"

if fields[3].match(/Task/) or fields[3].match(/Story/)
  fields[3]="enhancement"

elsif fields[3].match(/Bug/)
  fields[3]="bug"
end

fields[4]=fields[4].downcase.strip

labels.push(fields[3], fields[4])

description=fields[2].sub(/\"/, '')
description=description.reverse.sub(/\"/, '').reverse

card = {"card_number" => fields[0],"title" => fields[1], "body" => description, "labels" => labels}
json = card.to_json

begin
  temp_file=Tempfile.new('json_file')
  temp_file.write(json)
  FileUtils.mv(temp_file.path, path_to + "/" + filename_to + ".txt")
ensure
  temp_file.close
  temp_file.unlink
end
