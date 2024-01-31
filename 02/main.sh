#!/bin/bash

bash ./print_os_info.sh
# echo "Write info into file? [Y/N]"
read -p "Write info into file? [Y/N] " answer
case $answer in
    [Yy]* ) bash ./print_os_info.sh > "$(date +'%d_%m_%Y_%H_%M_%S').status";;

esac