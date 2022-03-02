#!/bin/sh

set -e

lb config noauto \
    --mode debian \
    --distribution bullseye \
    --linux-flavours amd64 \
    --apt aptitude \
    --apt-indices false \
    --apt-recommends true \
    --architectures amd64 \
    --updates true \
    --archive-areas "main contrib non-free" \
    --mirror-bootstrap http://deb.debian.org/debian \
    --mirror-chroot-security https://deb.debian.org/debian-security \
    --binary-images hdd \
    --binary-filesystem ext4 \
    --debian-installer none \
    --debian-installer-gui false \
    --initramfs live-boot \
    --iso-application juanCarlos \
    --iso-volume juanCarlos \
    --memtest none \
    --win32-loader false \
    --bootappend-live "boot=live config splash components keyboard-layouts=us,latam keyboard-variants=dvorak,deadtilde persistence persistence-encryption=luks persistence-media=usb"
    "${@}"
