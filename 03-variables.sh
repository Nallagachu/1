#!/bin/bash

USERID=$(id -u)  # Remove the space after '='

if [ "$USERID" -ne 0 ]; then  # Ensure correct syntax for conditions
    echo "Error: Please run this script as root"
    exit 1  # Exit to avoid running further commands as a non-root user
else
    echo "You are running this script as root"
    dnf install nginx -y  # Ensure this executes only when the script is run as root
fi
