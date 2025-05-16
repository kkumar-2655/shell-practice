#!/bin/bash

# Check if user is root
USERID=$(id -u)
if [ "$USERID" -ne 0 ]; then
  echo "Please run as root."
  exit 1
fi

# Update system
dnf update -y
if [ $? -eq 0 ]; then
  echo "Update successful."
else
  echo "Update failed."
  exit 1
fi

# Upgrade system
dnf upgrade -y
if [ $? -eq 0 ]; then
  echo "Upgrade successful."
else
  echo "Upgrade failed."
  exit 1
fi

# Install Java
dnf install -y java-17-openjdk
if [ $? -eq 0 ]; then
  echo "Java installation successful."
else
  echo "Java installation failed."
  exit 1
fi

# Install wget
dnf install -y wget
if [ $? -eq 0 ]; then
  echo "Wget installation successful."
else
  echo "Wget installation failed."
  exit 1
fi

# Add Jenkins repo
curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

if [ $? -eq 0 ]; then
  echo "Jenkins repo added successfully."
else
  echo "Failed to add Jenkins repo."
  exit 1
fi

# Import Jenkins key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
if [ $? -eq 0 ]; then
  echo "Jenkins key imported successfully."
else
  echo "Failed to import Jenkins key."
  exit 1
fi

# Install Jenkins
dnf install -y jenkins
if [ $? -eq 0 ]; then
  echo "Jenkins installation successful."
else
  echo "Jenkins installation failed."
  exit 1
fi

# Enable Jenkins service
systemctl enable jenkins
if [ $? -eq 0 ]; then
  echo "Jenkins service enabled successfully."
else
  echo "Failed to enable Jenkins service."
  exit 1
fi

# Start Jenkins service
systemctl start jenkins
if [ $? -eq 0 ]; then
  echo "Jenkins service started successfully."
else
  echo "Failed to start Jenkins service."
  exit 1
fi


