#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/logs/shell_scripting_logs"
SCRIPT_NAME=$(echo "$0" | cut -d "." -f1) 
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p "$LOGS_FOLDER"
echo "Script started at: $(date)" >> "$LOG_FILE"

if [ "$USERID" -ne 0 ]; then
    echo -e "$R ERROR:: Please run this script with root access $N" >> "$LOG_FILE"
    exit 1
else
    echo "You are running with root access" >> "$LOG_FILE"
fi

# Validate function to check installation status
VALIDATE() {
    if [ "$1" -eq 0 ]; then
        echo -e "Installing $2 ... $G SUCCESS $N" >> "$LOG_FILE"
    else
        echo -e "Installing $2 ... $R FAILURE $N" >> "$LOG_FILE"
        exit 1
    fi
}

# Package installation checks
for pkg in mysql python3 nginx; do
    dnf list installed "$pkg" >> "$LOG_FILE" 2>&1
    if [ $? -ne 0 ]; then
        echo "$pkg is not installed... going to install it" >> "$LOG_FILE"
        dnf install "$pkg" -y >> "$LOG_FILE" 2>&1
        VALIDATE $? "$pkg"
    else
        echo -e "Nothing to do. $pkg ... $Y already installed $N" >> "$LOG_FILE"
    fi
done
