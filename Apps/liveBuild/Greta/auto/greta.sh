#!/bin/sh

set -e

lb config noauto \
    --mode debian \
    --interactive shell \
    --distribution buster \
    --architectures amd64 \
    --debian-installer false \
    --updates true \
    --archive-areas "main contrib non-free" \
    --apt aptitude \
    --apt-indices false \
    --memtest none \
    --bootappend-live "boot=live components keyboard-layouts=us,latam keyboard-variants=dvorak,deadtilde persistence persistence-encryption=luks"
    "${@}"
