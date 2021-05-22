#!/usr/bin/bash

## screen + audio

ffmpeg \
-f pulse -ar 44100 -ac 1 -i default \
-f x11grab -video_size hd720 -framerate 15 -i :0.0+0,20 \
-c:v h264 /tmp/output.mp4

# This will grab the image from desktop, starting with the upper-left corner
# at x=0, y=20 with a width and height of 1280x720
# for 1366x768: -video_size xwga
# And audio, internal or mic (use pavucontrol to set)
# in mono at 44100Hz
# The output is encoded whith H.264, compatible for youtube

