#!/bin/bash
 NUMBER =$1 
 
 -gt == greater than
 -lt == less than
 # -eq == equal to
 # -ne == not equal to

    if [ $NUMBER -lt 10 ]
    then
        echo " Given $NUMBER is less then 10"
        else
        echo     "Given $NUMBER is greater then 10"
    fi  

