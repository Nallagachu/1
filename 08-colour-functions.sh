#!/bin/bash

# Define colors correctly
R="\e[31m"  # Red
G="\e[32m"  # Green
Y="\e[33m"  # Yellow
N="\e[0m"   # Reset

# Check if script is run as root
USERID=$(id -u)
if [ "$USERID" -ne 0 ]; then
    echo -e "${R}Error::${N} Please run this script as root"
    exit 1
else 
    echo -e "${G}You are running this script with root access${N}"
fi 

# Function to validate installation status
VALIDATE () {
    if [ "$1" -eq 0 ]; then
        echo -e "Installing $2 was ${G}successful${N}"
    else 
        echo -e "Installing $2 ${R}failed${N}"
        exit 1
    fi
}

# Check if MySQL is installed
dnf list installed mysql > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo -e "MySQL is not installed ${Y}, installing it now...${N}"
    dnf install mysql -y
    VALIDATE $? "MySQL"
else 
    echo -e "MySQL is already installed ${Y}, nothing to do.${N}"
fi

# Check if Python3 is installed
dnf list installed python3 > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo -e "Python3 is not installed ${R}, installing it now...${G}"
    dnf install python3 -y
    VALIDATE $? "Python3"
else 
    echo -e "Python3 is already installed ${Y}, nothing to do.${N}"
fi

# Check if Nginx is installed
dnf list installed nginx > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo -e "Nginx is not installed, installing it now..."
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx is already installed, ${Y}nothing to do.${N}"
fi
