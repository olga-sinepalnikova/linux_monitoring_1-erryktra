#!/bin/bash

# 1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black
WHITE='\033[0;37'
RED='\033[0;31'     
GREEN='\033[0;32'   
BLUE='\033[0;34'    
PURPLE='\033[0;35'
BLACK='\033[0;30'   

BG_WHITE=';47m'
BG_RED=';41m'      
BG_GREEN=';42m'    
BG_BLUE=';44m'     
BG_PURPLE=';45m'  
BG_BLACK=';40m'    

if [ $# != 4 ]; then
    echo "Too less arguments. Minimum number of arguments = 4"
    exit 1
fi

if [[ $1 == $2 || $3 == $4 ]]; then 
    echo "Colors can not match. Try to recall script."
    exit 1
fi

case $1 in
    1) BG_COLOR=$BG_WHITE;;
    2) BG_COLOR=$BG_RED;;
    3) BG_COLOR=$BG_GREEN;;
    4) BG_COLOR=$BG_BLUE;;
    5) BG_COLOR=$BG_PURPLE;;
    6) BG_COLOR=$BG_BLACK;;
esac

case $2 in
    1) FONT_COLOR=$WHITE;;
    2) FONT_COLOR=$RED;;
    3) FONT_COLOR=$GREEN;;
    4) FONT_COLOR=$BLUE;;
    5) FONT_COLOR=$PURPLE;;
    6) FONT_COLOR=$BLACK;;
esac

FONT_COLOR=$FONT_COLOR$BG_COLOR

case $3 in
    1) BG_COLOR_VALUE=$BG_WHITE;;
    2) BG_COLOR_VALUE=$BG_RED;;
    3) BG_COLOR_VALUE=$BG_GREEN;;
    4) BG_COLOR_VALUE=$BG_BLUE;;
    5) BG_COLOR_VALUE=$BG_PURPLE;;
    6) BG_COLOR_VALUE=$BG_BLACK;;
esac

case $4 in
    1) FONT_COLOR_VALUE=$WHITE;;
    2) FONT_COLOR_VALUE=$RED;;
    3) FONT_COLOR_VALUE=$GREEN;;
    4) FONT_COLOR_VALUE=$BLUE;;
    5) FONT_COLOR_VALUE=$PURPLE;;
    6) FONT_COLOR_VALUE=$BLACK;;
esac

FONT_COLOR_VALUE=$FONT_COLOR_VALUE$BG_COLOR_VALUE
bash ./print_os_info.sh $FONT_COLOR $FONT_COLOR_VALUE
