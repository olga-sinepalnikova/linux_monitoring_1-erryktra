#!/bin/bash

echo "HOSTNAME = $HOSTNAME"
TIMEZONE=$(cat /etc/timezone)
UPTIME_S=$(</proc/uptime)
UPTIME_S=${UPTIME_S%%.*}
echo "TIMEZONE = $(timedatectl | awk '{print $3 $4 $5}' | grep $TIMEZONE)"
echo "USER = $(whoami)"
echo "OS = $(grep "VERSION=" /etc/os-release | cut -c10- | sed 's/\(([a-zA-Z ]*)*\)"//g' | sed 's/ $//')"
date | awk '{print "DATE = " $3 " " $2 " " $6 " " $4}'
echo "UPTIME = $(uptime -p)"
echo "UPTIME_SEC = $UPTIME_S"
echo "IP = $(hostname -i)"
ifconfig eth0 | awk '/netmask/{print "MASK = " $4}'
ip r | grep ^def | awk '{print "GATEWAY = " $3}'
free -h --giga | awk '/Mem/{print "RAM_TOTAL = " $2}'
free -h --giga | awk '/Mem/{print "RAM_USED = " $3}'
free -h --giga | awk '/Mem/{print "RAM_FREE = " $4}'
sudo fdisk -l | awk '/sda/{print "SPACE_ROOT = " $3 " " $4}'
sudo df -kh | awk '/sdc/{print "SPACE_ROOT_USED = " $3}'
sudo df -kh | awk '/sdc/{print "SPACE_ROOT_FREE = " $4}'