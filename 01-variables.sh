#!/bin/bash 
echo "All variables are strings in bash: $@"
echo "number of variables: $#"
echo "script name: $0"
echo "current directory: $(pwd)"
echo "user running the script: $USER"
echo "home directory of the user: $HOME"
echo "process id of the script: $$"
sleep 10 &
echo "pid of the last background background: $!"
 
