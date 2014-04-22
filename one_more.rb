filename = ARGV[0]
text = File.new(filename).read

if(text.match(/^### Description\n+###/))
  text = text.sub(/^### Description\n+/, '')
end
if (text.match(/^### Acceptance Criteria\n\n-   Documentation\n-   Performance testing\n\n###/)) 
  text = text.sub(/^### Acceptance Criteria\n\n-   Documentation\n-   Performance testing\n\n/, '') 
end
if(text.match(/^### Dependencies\n###/))
  text = text.sub(/^### Dependencies\n/, '')
end
if(text.match(/^### Test Scenarios\n\"/))
  text = text.sub(/^### Test Scenarios\n/, '')
end
