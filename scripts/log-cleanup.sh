#!/bin/bash

if [ -z "$1" ]; then
    read -p "Enter folder name: " foldername
else
    foldername=$1
fi

if [ -d "$foldername" ]; then
    echo "Folder exists"
    log_count=$(find "$foldername" -name "*.log" | wc -l)
    if [ "$log_count" -eq 0 ]; then
        echo "No log file found in $foldername - nothing to clean up"
        exit 0
    else 
        echo "Found $log_count log files"
        archive_name="logs-backup-$(date +%Y%m%d-%H%M%S).tar.gz"
        tar -czvf "$archive_name" "$foldername"

        if [ -f "$archive_name" ] && [ -s "$archive_name" ]; then
            echo "$archive_name is verified"
            find "$foldername" -name "*.log" -delete
            echo "Original files deleted"
            echo "--- Summary: $log_count log files have been archived and saved in $archive_name and the original files have been deleted ---"
            echo "Files archived: $log_count"
            echo "Archive name: $archive_name"

        else 
            echo "$archive_name failed or is empty"
            exit 1
        fi

    fi
else
    echo "Folder doesn't exist"
    exit 1
fi