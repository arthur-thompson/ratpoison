#!/bin/sh

XPOS=0
WIDTH=1920
HEIGHT=16
FONT="terminus-12"
FG="#575B70"
BG="#131C26"

GREEN="^fg(#5AF78E)^bg()"
YELLOW="^fg(#F4F99D)^bg()"
RED="^fg(#FF6E67)^bg()"
WHITE="^fg(#E6E6E6)^bg()"
PINK="^fg(#FF92D0)^bg()"
BLUE="^fg(#9AEDFE)^bg()"
MAGENTA="^fg(#CAA9FA)^bg()"


CLEAN="^fg()^bg()"

while true; do

	XWINDOW=$(echo "Active Window: $PINK`echo $(xdotool getwindowfocus getwindowname | cut -d' ' -f1-2)`$CLEAN")	
	TIME=$(echo "Date: $GREEN`echo $(date +"%a %d %B at %I:%M %p")`$CLEAN")
#	BATTERYLINE=$(echo "Battery: $RED`cat /sys/class/power_supply/BAT0/capacity `%$CLEAN")		
	KERNEL=$(echo "Kernel: $YELLOW`echo $(uname -r)`$CLEAN")
#	UPDATES=$(echo "Updates: $WHITE`echo $(checkupdates | wc -l)`$CLEAN")
	UPTIME=$(echo "Uptime: $MAGENTA`echo $(uptime -p)`$CLEAN")
#	WIFILINE=$(echo "WiFi: $BLUE`echo $(systemctl is-active --quiet NetworkManager && echo Connected)`$CLEAN")
	
	echo "  $XWINDOW  |  $TIME  |  $KERNEL  |  $UPTIME "

	sleep 1	

done | dzen2 -h $HEIGHT -ta l -x $XPOS -w $WIDTH -h 14 -fg $FG -bg $BG -fn $FONT
