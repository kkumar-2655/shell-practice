#!/bin/bash
SERVICE="jenkins"
# Check if the service is running 

if systemctl status "$SERVICE" | grep running; then
  echo "$SERVICE is running...."

else
# systemctl start "$SERVICE"
  echo "$SERVICE is not running."
fi
