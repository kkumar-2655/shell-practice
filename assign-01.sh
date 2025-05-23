#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
# Check if filename is passed as argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 assign-01.txt"
  exit 1
fi

FILE="$1"

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo -e "File '$FILE' $R not found! $N"
  exit 2
fi

# Process the file: lowercase, remove punctuation, split words, count, and sort
cat "$FILE" \
  | tr '[:upper:]' '[:lower:]' \
  | tr -c '[:alnum:]' '[\n*]' \
  | grep -v '^$' \
  | sort \
  | uniq -c \
  | sort -nr \
  | head -n 5
