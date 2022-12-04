#!/bin/bash


 sudo -u kentagent DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send 'Hello world!' 'This is an example notification.'
