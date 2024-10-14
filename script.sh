#!/bin/bash

DIRECTORY="foo"
FILE_CONTENT="${1:-Que me gusta la bash}"
FILE_PATH="$DIRECTORY/dummy/file1.txt"

#Check if the directory already exists, if it does, delete it
if [ -d "$DIRECTORY" ]; then 
	echo "Directory $DIRECTORY alredy exists. Deleting..."
	rm -rf "$DIRECTORY"
else
	echo "Directory $DIRECTORY doesn't exists. Continuing..."
fi 

#Creating the directories and subdirectories
mkdir -p "$DIRECTORY/dummy" "$DIRECTORY/empty" 

touch "$FILE_PATH"
echo "$FILE_CONTENT" > "$FILE_PATH"

cd "$DIRECTORY/dummy" || exit
touch file2.txt

cat file1.txt > file2.txt

cd ../..||exit

mv "$DIRECTORY/dummy/file2.txt" "$DIRECTORY/empty/"

cat "$DIRECTORY/dummy/file1.txt" "$DIRECTORY/empty/file2.txt"




