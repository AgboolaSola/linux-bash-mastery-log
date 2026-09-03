#!/bin/bash

if [ "$#" -eq 0 ]; then
 echo "Error: no filename provided"
 echo "Usage: ./hello.sh <filename>"
 exit 1
fi

filename=$1

if [ -f "$filename" ]; then
    echo "$filename exists"
else
    echo "$filename is a non-existent file"
fi
