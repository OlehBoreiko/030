#!/bin/bash

#author: Oleh Boreiko

# Current date
current_date=`date +%Y%m%d`

# Number of days for backup
days=0 #for last 24 hours

# Source directory
source_dir=$1

# Backups directory
backup_dir=$2

# Check if any parameters given
if [ $# -eq 0 ]; then
    echo "No parameters provided! Please run the script as the following:"
    echo "./backup.sh {source_folder} {destination_folder}"
    exit 1

elif [ -z "$2" ];
  then
    echo "You have not specified the Destination Folder! Please run the script as the following:"
    echo "./backup.sh {source_folder} {destination_folder}"
    exit 1

#Checking the Destination directory exists/create if not
elif ! [[ -d "$2" ]];
  then
    echo "Destination directory does not exist on your filesystem. Thats okay, we'll try to create it.."
    mkdir $2
fi

# Create a target directory for backup
target_dir=$2/$current_date
mkdir $target_dir

# Performing the backup using find and rsync
echo "Performing backup of your files from $source_dir directory..."
echo

find $source_dir -mtime $days -printf %P\\0\\n | rsync -av --files-from=- $source_dir $target_dir

echo
echo "All new data have been successfully saved in $target_dir directory."



