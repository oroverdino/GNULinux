#!/bin/sh

# Remapeo del numpad Genius
# 7: [
# 8: space
# 9: ]
# *: Ctrl

xmodmap -e "keycode 79 = bracketleft"
xmodmap -e "keycode 80 = space"
xmodmap -e "keycode 81 = bracketright"
xmodmap -e "keycode 63 = Control_L"
