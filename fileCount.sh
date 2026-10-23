#!/bin/bash


file_count=$(ls | wc -l)
echo "There are ${file_count} files in this directory"

read -p "Enter the file you want to count: " file
file_count=$(cat ${file} | wc -l)
echo "There are ${file_count} lines in ${file}"

#Sorting the content of the file and remove duplicates
${file} | sort | uniq > sortedFile.txt
sorted_file=$(cat sortedFile.txt)

echo "The content of the file has been sorted and duplicates have been removed. The content is: ${sorted_file}"
