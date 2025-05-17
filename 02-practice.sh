#!/bin/bash
SERVICE="jenkins"
# Check if the service is running 

if systemctl status "$SERVICE" | grep active; then
  echo "$SERVICE is running...."

else
systemctl start "$SERVICE"
  echo "$SERVICE is running."
fi
