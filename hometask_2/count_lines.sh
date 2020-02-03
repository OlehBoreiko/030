#!/bin/bash

#author: Oleh Boreiko

#File location
FILE=versions.txt

#Checking the file exists/download if not exist
if ! [ -f "$FILE" ]; then
    echo "It seems the file $FILE doesn't exist in the current folder. Let's download it :)"
    curl http://yoko.ukrtux.com:8899/versions.txt --output versions.txt
else 
    echo "$FILE exists. OK"
fi

#Analize the file and print the result

echo "Calculating the most repeated line in the file..."
echo "Result:"
cut -d' ' -f1 $FILE | sort | uniq -c | sort -rn | head -n1
