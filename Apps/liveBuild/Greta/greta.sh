#!/bin/bash

lb config \
    --mode debian \
    --binary-images iso-hybrid \
    --iso-application Greta \
    --iso-volume Greta \
    --distribution buster \
    --architectures amd64 \
    --debian-installer live \
    --debian-installer-gui false \
    --updates true \
    --archive-areas "main contrib non-free" \
    --apt aptitude \
    --apt-indices false \
    --apt-recommends true \
    --memtest none \
    --bootappend-live "boot=live components keyboard-layouts=latam,us keyboard-variants=deadtilde,dvorak persistence persistence-media=removable-usb"
    "${@}"
