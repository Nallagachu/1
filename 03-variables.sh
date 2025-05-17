#!/bin/bash

USERID=$(id -u)

if [ "$USERID" -ne 0 ]; then
    echo "Error: Please run this script as root"
    exit 1
else
    echo "You are running this script as root"
fi

# Install Nginx
dnf install nginx -y
if [ $? -eq 0 ]; then
    echo "Nginx installed successfully"
else
    echo "Failed to install Nginx"
    exit 1
fi

# Install MySQL
dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "Failed to install MySQL"
    exit 1
else
    echo "MySQL installed successfully"
fi
