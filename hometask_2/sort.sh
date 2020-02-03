#!/bin/bash

#author: Oleh Boreiko

#File location
FILE=versions.txt

#Checking the file exists/download if not
if ! [ -f "$FILE" ]; then
    echo "It seems the file $FILE doesn't exist in the current folder. Let's download it :)"
    curl http://yoko.ukrtux.com:8899/versions.txt --output versions.txt
else 
    echo "$FILE exists. OK"
fi

#Sorting the file by versions in arithmetic ascending mode (using sort -V, --version-sort - natural sort of (version) numbers within text
sort -V $FILE

