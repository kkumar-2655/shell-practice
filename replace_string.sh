#!/bin/bash

# Usage: ./replace_string.sh "old_string" "new_string" /path/to/directory

OLD_STRING=$1
NEW_STRING=$2
TARGET_DIR=$3

# Check arguments
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 \"old_string\" \"new_string\" /c/Users/Kiran/daws84s-kiran/repos/shell-practice"
  exit 1
fi

# Loop through .txt files and replace the string
find "$TARGET_DIR" -type f -name "*.txt" | while read -r file; do
  echo "Processing $file ..."
  sed -i "s/${OLD_STRING}/${NEW_STRING}/g" "$file"
done

echo "✅ Replacement complete."
echo "All .txt files in $TARGET_DIR have been processed."

# Check if the replacement was successful
if [ $? -eq 0 ]; then
  echo "✅ Replacement successful."
else
  echo "❌ Replacement failed."
fi

