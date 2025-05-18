#!/bin/bash

USERID=$(id -u)

if [ "$USERID" -ne 0 ]; then
    echo "Error: Please run this script as root"
    exit 1
else 
    echo "You are running this script with root access"
fi 

# Function to validate installation status
VALIDATE (){
    if [ $1 -eq 0 ]; then
        echo "Installing $2 was successful"
    else 
        echo "Installing $2 failed"
        exit 1
    fi
}

# Check if MySQL is installed
dnf list installed mysql
if [ $? -ne 0 ]; then
    echo "MySQL is not installed, installing it now..."
    dnf install mysql -y
    VALIDATE $? "MySQL"
else 
    echo "MySQL is already installed, nothing to do."
fi

# Check if Python3 is installed
dnf list installed python3
if [ $? -ne 0 ]; then
    echo "Python3 is not installed, installing it now..."
    dnf install python3 -y
    VALIDATE $? "Python3"
else 
    echo "Python3 is already installed, nothing to do."
fi

# Check if Nginx is installed
dnf list installed nginx
if [ $? -ne 0 ]; then
    echo "Nginx is not installed, installing it now..."
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo "Nginx is already installed, nothing to do."
fi
