#!/bin/bash

AMOUNT=$(sudo pacman -Syuw --noconfirm | grep Packages | awk '{print $2}' | sed "s/(//" | sed "s/)//")

if [ -z $AMOUNT ]
then
	echo $AMOUNT
	exit
fi

AMOUNT="$AMOUNT packages waiting for update."
sudo -u kentagent DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "$AMOUNT" 
