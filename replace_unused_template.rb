require 'tempfile'
require 'fileutils'

filename = ARGV[0]
filename_to = ARGV[1]
path_to = "issues_dir/changed_md_files"
text = File.new(filename).read


if(text.match(/^### \n/))
    text = text.sub(/^### \n/, '')
end
if(text.match(/^### Description\n+###/))
    text = text.sub(/^### Description\n+/, '')
end
if (text.match(/^### Acceptance Criteria\n\n-   Documentation\n-   Performance testing\n\n###/))
    text = text.sub(/^### Acceptance Criteria\n\n-   Documentation\n-   Performance testing\n\n/, '')
end
if(text.match(/^### Dependencies\n###/))
    text = text.sub(/^### Dependencies\n/, '')
end
if(text.match(/^### Test Scenarios\n+\"/))
    text = text.sub(/^### Test Scenarios\n+/, '')
end

begin
  temp_file=Tempfile.new('random')
  temp_file.puts text
  FileUtils.mv(temp_file.path, path_to + "/" + filename_to + ".md")
ensure
  temp_file.close
  temp_file.unlink
end
  
  


