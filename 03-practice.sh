#!/bin/bash
SERVICE="git"
# Check if the service is running 

if "$SERVICE --version" | grep git ; then
  echo "$SERVICE is running...."
fi



