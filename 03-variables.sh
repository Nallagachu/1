#!/bin/bash

USERID=$(id -u)  # Removed space after '='

if [ "$USERID" -ne 0 ]; then  # Fixed condition brackets and added missing value
    echo "Error: Please run this script as root"
    exit 1  # Exit to prevent unintended execution
else
    echo "You are running this script as root"
fi

dnf install nginx -y  # Ensures this runs only if the user is root
