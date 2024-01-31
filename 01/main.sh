#!/bin/bash
re='^[+-]?[0-9]+([.][0-9]+)?$'
if [ $# != 1 ]; then
    echo "Too many arguments"
elif ! [[ $1 =~ $re ]]; then
   echo $1
else
    echo "Incorrect input"
fi

