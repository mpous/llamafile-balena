#!/bin/bash

# File name
FILE_NAME="llamafile-server-0.1-llava-v1.5-7b-q4"

echo "Starting ... "

# Check if the file already exists
if [ ! -f "/data/$FILE_NAME" ]; then
	echo "Downloading the file...."
	    # Download the file
	        wget -O "/data/$FILE_NAME" https://huggingface.co/Mozilla/llava-v1.5-7b-llamafile/resolve/0bb382b03622305a4e383f0eafce7915404fbd0c/llamafile-server-0.1-llava-v1.5-7b-q4
else
	echo "The $FILE_NAME is already downloaded at the /data/ folder..."
fi

echo "Make the binay executable..."

# Make the binary executable
chmod 755 "/data/$FILE_NAME"

# Execute the binary
# sh -c for if mac has zsh issues

echo "Starting the $FILE_NAME..."

sh -c "/data/$FILE_NAME --host 0.0.0.0"
#sleep infinity
