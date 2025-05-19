#!/bin/bash

USERID=$(id -u)
R="/e[31m"  
G="/e[32m"
N="/e[33m"


if [ "$USERID" -ne 0 ]; then
    echo " $R Error:: $N Please run this script as root"
    exit 1
else 
    echo "You are running this script with root access"
fi 

# Function to validate installation status
VALIDATE (){
    if [ $1 -eq 0 ]; then
        echo "Installing $2 was $G successful"
    else 
        echo "Installing $2 $R failed"
        exit 1
    fi
}

# Check if MySQL is installed
dnf list installed mysql
if [ $? -ne 0 ]; then
    echo -e  "MySQL is not installed $Y , installing it now $N  ..."
    dnf install mysql -y
    VALIDATE $? "MySQL"
else 
    echo -e "MySQL is already installed $Y, nothing to do. $N "
fi

# Check if Python3 is installed
dnf list installed python3
if [ $? -ne 0 ]; then
    echo "Python3 is not installed $R , installing it now...$G "
    dnf install python3 -y
    VALIDATE $? "Python3"
else 
    echo -e  "Python3 is already installed $Y, nothing to do. $N"
fi

# Check if Nginx is installed
dnf list installed nginx
if [ $? -ne 0 ]; then
    echo "Nginx is not installed, installing it now..."
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx is already installed, $Y   nothing to do. $N "
fi
