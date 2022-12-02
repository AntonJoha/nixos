#!/bin/bash

AMOUNT=$(sudo pacman -Syuw --noconfirm | grep Packages | awk '{print $2}' | sed "s/(//" | sed "s/)//")

cowsay "$AMOUNT packages waiting for update."
