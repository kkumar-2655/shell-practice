#!/bin/bash
SERVICE="jenkins"
# Check if the service is running 

if ! pgrep -x "$SERVICE" > /dev/null; then
  echo "$SERVICE is not running. Restarting..."
  systemctl start "$SERVICE"
else
  echo "$SERVICE is running."
fi
