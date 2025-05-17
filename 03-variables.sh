#!/bin/bash

USERID=$(id -u)  # Removed unnecessary space

if [ "$USERID" -ne 0 ]; then  # Fixed missing value in condition
    echo "Error: Please run this script as root"
else
    echo "You are running this script as root"
fi

dnf install nginx -y