#!/bin/bash

# Check params
if [ $# -le 0 ]
then
  echo -e "\nUsage:\n DIRECTORY -- program to hash a directory of files and output each hash to 'original-filename.md5'"
  exit 1
fi

# For each file in directory
for f in $1/*
do
	# md5sum the file and take the first column (just the hash) 
	hash=$(md5sum $f | awk '{print $1}')

	# Output hash to file with the original filename with .md5 suffix
	printf "%s" "$hash" >> "$f.md5"
done