#!/bin/bash

FONT_COLOR=$1
FONT_COLOR_VALUE=$2

TIMEZONE=$(cat /etc/timezone)
UPTIME_S=$(</proc/uptime)
UPTIME_S=${UPTIME_S%%.*}
DATE=$(date | awk 'function add_color(color_value){return $(color_value)} {print $3 " " $2 " " $6 " " $4"\033[0;37m"}')
MASK=$(ifconfig eth0 | awk '/netmask/{print $4}')
GATEWAY=$(ip r | grep ^def | awk '{print $3}')
RAM_TOTAL=$(free -h --giga | awk '/Mem/{print $2}')
RAM_USED=$(free -h --giga | awk '/Mem/{print $3}')
RAM_FREE=$(free -h --giga | awk '/Mem/{print $4}')
SPACE_ROOT=$(sudo fdisk -l | awk '/sda/{print $3 " " $4}')
SPACE_ROOT=$(sudo fdisk -l | awk '/sda/{print $3 " " $4}')
SPACE_ROOT_USED=$(sudo df -kh | awk '/sdc/{print $3}')
SPACE_ROOT_FREE=$(sudo df -kh | awk '/sdc/{print $4}')

source colors.conf
export column1_bg=$column1_background
export column1_font=$column1_font_color
export column2_bg=$column2_background
export column2_font=$column2_font_color

echo -e "${FONT_COLOR}HOSTNAME\033[0;37m = ${FONT_COLOR_VALUE}$HOSTNAME\033[0;37m"
echo -e "${FONT_COLOR}TIMEZONE\033[0;37m = ${FONT_COLOR_VALUE}$(timedatectl | awk '{print $3 $4 $5}' | grep $TIMEZONE)\033[0;37m"
echo -e "${FONT_COLOR}USER\033[0;37m = ${FONT_COLOR_VALUE}$(whoami)\033[0;37m"
echo -e "${FONT_COLOR}OS\033[0;37m =  ${FONT_COLOR_VALUE}$(grep "VERSION=" /etc/os-release | cut -c10- | sed 's/\(([a-zA-Z ]*)*\)"//g' | sed 's/ $//')\033[0;37m"
echo -e "${FONT_COLOR}DATE\033[0;37m = ${FONT_COLOR_VALUE}$DATE\033[0;37m"
echo -e "${FONT_COLOR}UPTIME\033[0;37m = ${FONT_COLOR_VALUE}$(uptime -p)\033[0;37m"
echo -e "${FONT_COLOR}UPTIME_SEC\033[0;37m = ${FONT_COLOR_VALUE}$UPTIME_S\033[0;37m"
echo -e "${FONT_COLOR}IP\033[0;37m = ${FONT_COLOR_VALUE}$(hostname -i)\033[0;37m"
echo -e "${FONT_COLOR}MASK\033[0;37m = ${FONT_COLOR_VALUE}$MASK\033[0;37m"
echo -e "${FONT_COLOR}GATEWAY\033[0;37m = ${FONT_COLOR_VALUE}$GATEWAY\033[0;37m"
echo -e "${FONT_COLOR}RAM_TOTAL\033[0;37m = ${FONT_COLOR_VALUE}$RAM_TOTAL\033[0;37m"
echo -e "${FONT_COLOR}RAM_USED\033[0;37m = ${FONT_COLOR_VALUE}$RAM_USED\033[0;37m"
echo -e "${FONT_COLOR}RAM_FREE\033[0;37m = ${FONT_COLOR_VALUE}$RAM_FREE\033[0;37m"
echo -e "${FONT_COLOR}SPACE_ROOT\033[0;37m = ${FONT_COLOR_VALUE}$SPACE_ROOT\033[0;37m"
echo -e "${FONT_COLOR}SPACE_ROOT_USED\033[0;37m = ${FONT_COLOR_VALUE}$SPACE_ROOT_USED\033[0;37m"
echo -e "${FONT_COLOR}SPACE_ROOT_FREE\033[0;37m = ${FONT_COLOR_VALUE}$SPACE_ROOT_FREE\033[0;37m"
echo 

if [[ $column1_bg == 1 && $column1_font == 2 && $column2_bg == 5 && $column2_font == 6 ]]; then
    echo "Column 1 background = default (white)
Column 1 font color = default (red)
Column 2 background = default (purple)
Column 2 font color = default (blask)"
else
    echo "Column 1 background = $column1_bg ($3)
Column 1 font color = $column1_font ($4)
Column 2 background = $column2_bg ($5)
Column 2 font color = $column2_font ($6) "
fi