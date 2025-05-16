
#!/bin/bash

# Check if the script is run by root user
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit 1
fi

# Check if git is installed
if command -v git >/dev/null 2>&1; then
  echo "Git is installed."
else
  echo "Git is NOT installed."
fi