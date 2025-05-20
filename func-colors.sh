#!/bin/bash

# Check if user is root
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"




if [ "$USERID" -ne 0 ]; then
  echo "$R Please run as root $N"
  exit 1
fi

# Update system
dnf update -y
if [ $? -eq 0 ]; then
  echo "$G Update successful $N"
else
  echo "$R Update failed $N"
  exit 1
fi

# Upgrade system
dnf upgrade -y
if [ $? -eq 0 ]; then
  echo "$G Upgrade successful $N"
else
  echo "$R Upgrade failed $N"
  exit 1
fi

# Install Java
dnf install -y java-17-openjdk
if [ $? -eq 0 ]; then
  echo "$G Java installation successful $N"
else
  echo "$R Java installation failed $N"
  exit 1
fi

# Install wget
dnf install -y wget
if [ $? -eq 0 ]; then
  echo "$G Wget installation successful $N"
else
  echo "$R Wget installation failed $N"
  exit 1
fi

# Add Jenkins repo
curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

if [ $? -eq 0 ]; then
  echo "$G Jenkins repo added successfully $N"
else
  echo "$R Failed to add Jenkins repo $N"
  exit 1
fi

# Import Jenkins key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
if [ $? -eq 0 ]; then
  echo "$G Jenkins key imported successfully $N"
else
  echo "$R Failed to import Jenkins key $N"
  exit 1
fi

# Install Jenkins
dnf install -y jenkins
if [ $? -eq 0 ]; then
  echo "$G Jenkins installation successful $N"
else
  echo "$R Jenkins installation failed $N"
  exit 1
fi

# Enable Jenkins service
systemctl enable jenkins
if [ $? -eq 0 ]; then
  echo "$G Jenkins service enabled successfully $N"
else
  echo "$R Failed to enable Jenkins service $N"
  exit 1
fi

# Start Jenkins service
systemctl start jenkins
if [ $? -eq 0 ]; then
  echo "$G Jenkins service started successfully $N"
else
  echo "$R Failed to start Jenkins service $N"
  exit 1
fi


