#!/bin/bash

# Directory containing the files to be processed
DIRECTORY=<dir>

# Check if the directory exists and is accessible
if [ ! -d "$DIRECTORY" ]; then
  echo "Error: Directory '$DIRECTORY' not found or inaccessible."
  exit 1
fi

# Use find to loop through all files in the directory and its subdirectories
find "$DIRECTORY" -type f | while read FILE; do
  # Backup the original file with a .bak extension
  cp "$FILE" "${FILE}.bak"
  
  # Remove \r\n and save to a temporary file
  tr -d '\r' < "${FILE}.bak" > "${FILE}.tmp"
  
  # Replace the original file with the processed file
  mv "${FILE}.tmp" "$FILE"
done

echo "Processing complete."
