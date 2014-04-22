#!/bin/bash

rm -rf issues_dir/html_files/*
rm -rf issues_dir/md_files/*
rm -rf issues_dir/changed_md_files/*
rm -rf issues_dir/json_files/*
rm -rf issues_dir/modified_json_files/*

#Add delimiter to identify columns
cp mingle_export mingle_export_modified
gsed -i -e "s/\t/@@/g" mingle_export_modified

#Split stories into files.
file_name=0;
while read line
do
  echo $line | grep -q -o "^[0-9]\{4\}" 
  if [ $? -eq 0 ]; then
    let file_name=$file_name+1
  fi
  echo $line >> issues_dir/html_files/$file_name.html
done < mingle_export_modified

#Convert to markdown.
md_file_name=1;
while [ $md_file_name -le $file_name ]
do
  pandoc -f html -t markdown issues_dir/html_files/$md_file_name.html  | tr -c -d 'a-zA-Z[:digit:][:punct:] \n\r\t' >> issues_dir/md_files/$md_file_name.md
  let md_file_name=$md_file_name+1 
done

#Remove unused lines.
cd issues_dir/md_files
#gsed -i -e "1s/^[0-9]\{4\} //" *
gsed -i -e "s/{{ table query: SELECT number,.*//" *
gsed -i -e "s/'Scenarios - Task'.*//" *
gsed -i -e "s/'Features - Developer Task'.*//" *
gsed -i -e "s/'Features - Story'.*//" *
gsed -i -e "s/'Scenarios - Story'.*//" *
gsed -i -e "s/'Scenarios - Bug'.*//" *
gsed -i -e "s/'\"'.*/'\\\"'/" *
cd ../..
gsed -i -f delete_newline_sed issues_dir/md_files/*

#Remove unused sections of card.
changed_md_file=1;
while [ $changed_md_file -le $file_name ]
do
      ruby replace_unused_template.rb issues_dir/md_files/$changed_md_file.md $changed_md_file
      let changed_md_file=$changed_md_file+1
done

gsed -i -f delete_newline_sed issues_dir/changed_md_files/*

#Convert to json
changed_md_file=1;
while [ $changed_md_file -le $file_name ]
do
      ruby convert_to_json.rb issues_dir/changed_md_files/$changed_md_file.md $changed_md_file
      let changed_md_file=$changed_md_file+1
done

#upload_issues
json_file=1;
while [ $json_file -le $file_name ]
do
      ruby upload_issues.rb issues_dir/json_files/$json_file.txt $json_file
      let json_file=$json_file+1
done