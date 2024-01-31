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

source colors.conf
export column1_bg=$column1_background
export column1_font=$column1_font_color
export column2_bg=$column2_background
export column2_font=$column2_font_color

if [[ $column1_bg == $column1_font || $column2_bg == $column2_font ]]; then
    echo "Colors can not match. Update color.conf and try to recall script."
    exit 1
fi 
case $column1_bg in
    1) BG_COLOR=$BG_WHITE
        bg_color_name_1="white"
        ;;
    2) BG_COLOR=$BG_RED
        bg_color_name_1="red"
        ;;
    3) BG_COLOR=$BG_GREEN
        bg_color_name_1="green"
        ;;
    4) BG_COLOR=$BG_BLUE
        bg_color_name_1="blue"
        ;;
    5) BG_COLOR=$BG_PURPLE
        bg_color_name_1="purple"
        ;;
    6) BG_COLOR=$BG_BLACK
        bg_color_name_1="black"
        ;;
esac

case $column1_font in
    1) FONT_COLOR=$WHITE
        font_color_name_1="white"
        ;;
    2) FONT_COLOR=$RED
        font_color_name_1="red"
        ;;
    3) FONT_COLOR=$GREEN
        font_color_name_1="green"
        ;;
    4) FONT_COLOR=$BLUE
        font_color_name_1="blue"
        ;;
    5) FONT_COLOR=$PURPLE
        font_color_name_1="purple"
        ;;
    6) FONT_COLOR=$BLACK
        font_color_name_1="black"
        ;;
esac

FONT_COLOR=$FONT_COLOR$BG_COLOR

case $column2_bg in
    1) BG_COLOR_VALUE=$BG_WHITE
        bg_color_name_2="white"
        ;;
    2) BG_COLOR_VALUE=$BG_RED
        bg_color_name_2="red"
        ;;
    3) BG_COLOR_VALUE=$BG_GREEN
        bg_color_name_2="green"
        ;;
    4) BG_COLOR_VALUE=$BG_BLUE
        bg_color_name_2="blue"
        ;;
    5) BG_COLOR_VALUE=$BG_PURPLE
        bg_color_name_2="purple"
        ;;
    6) BG_COLOR_VALUE=$BG_BLACK
        bg_color_name_2="black"
        ;;
esac

case $column2_font in
    1) FONT_COLOR_VALUE=$WHITE
        font_color_name_2="white"
        ;;
    2) FONT_COLOR_VALUE=$RED
        font_color_name_2="red"
        ;;
    3) FONT_COLOR_VALUE=$GREEN
        font_color_name_2="green"
        ;;
    4) FONT_COLOR_VALUE=$BLUE
        font_color_name_2="blue"
        ;;
    5) FONT_COLOR_VALUE=$PURPLE
        font_color_name_2="purple"
        ;;
    6) FONT_COLOR_VALUE=$BLACK
        font_color_name_2="black"
        ;;
esac

FONT_COLOR_VALUE=$FONT_COLOR_VALUE$BG_COLOR_VALUE
bash ./print_os_info.sh $FONT_COLOR $FONT_COLOR_VALUE $bg_color_name_1 $font_color_name_1 $bg_color_name_2 $font_color_name_2
