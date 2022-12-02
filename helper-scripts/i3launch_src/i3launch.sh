#!/bin/bash

#Needed to allow a refresh of i3
killall polybar
killall dunst
killall easyrice_deamon

#All programs to send
polybar example &
setimage -f

easyrice_deamon /home/kentagent/Scripts/setimage_src/copy.jpg /home/kentagent/Scripts/setimage_src/temp.jpg

dunst &
setxkbmap se

xrandr --output DVI-D-0 --auto --output HDMI-0 --right-of DVI-D-0


#DONE
./home/kentagent/Scripts/downloadupdates
notify-send "Startup done"
