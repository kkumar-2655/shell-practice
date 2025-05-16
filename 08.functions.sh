#!/bin/bash

USERID=$(id -u)
if [ "$USERID" -ne 0 ]; then
  echo "Please run as root."
  exit 1
fi

dnf update -y

if [ $?==0 ]; then
  echo "Update successful."
else
  echo "Update failed."
  exit 1
fi



dnf upgrade -y
if [ $?==0 ]; then
  echo "Upgrade successful."
else
  echo "Upgrade failed."
  exit 1
fi

dnf install  java-11-openjdk-devel -y

if [ $?==0 ]; then
  echo "Java installation successful."
else
  echo "Java installation failed."
  exit 1
fi

dnf install wget -y
if [ $?==0 ]; then
  echo "Wget installation successful."
else
  echo "Wget installation failed."
  exit 1
fi



wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

if [ $?==0 ]; then
  echo "Jenkins repo added successfully."
else
  echo "Failed to add Jenkins repo."
  exit 1
fi

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
if [ $?==0 ]; then
  echo "Jenkins key imported successfully."
else
  echo "Failed to import Jenkins key."
  exit 1
fi



dnf install -y jenkins


if [ $?==0 ]; then
  echo "Jenkins installation successful."
else
  echo "Jenkins installation failed."
  exit 1
fi

systemctl enable Jenkins

if [ $?==0 ]; then
  echo "Jenkins service enabled successfully."
else
  echo "Failed to enable Jenkins service."
  exit 1
fi

systemctl start Jenkins
if [ $?==0 ]; then
  echo "Jenkins service started successfully."
else
  echo "Failed to start Jenkins service."
  exit 1
fi

