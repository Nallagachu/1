#!/bin/bash

NUMBER=$1

# Check if NUMBER is less than 10
if [ $NUMBER -lt 10 ]; then
    echo "Given $NUMBER is less than 10"
else
    echo "Given $NUMBER is less then 10"
fi
