#!/bin/bash

# play bell sound and avoid the exit information from aplay
aplay /home/leandro/Documents/Gugler/bellTest/bell.wav 2>/dev/null

# mandamos un msj a systemd
#echo "The bell had sound" | systemd-cat -t testBell
# for check run as root: journal -t testBell
