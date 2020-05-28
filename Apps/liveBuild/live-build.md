# Live [live-build](https://live-team.pages.debian.net/live-manual/html/live-manual/index.en.html)
### 200207

## Install

```
# aptitude install live-build
```

## lb config

### auto/config

```
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
    --interactive shell \
    --bootappend-live "boot=live components keyboard-layouts=es,us keyboard-variants=,dvorak persistence persistence-media=removable-usb"
    "${@}"
```

## Basic packages

The list is a file whith the names of the packages.

For example:

config/package-lists/lmt.list.chroot
:-----------------:
aptitude
arc-theme
bash-completion
cups
expect
git
grub2-common
highlight
mate-tweak
nmon
numix-icon-theme
ranger
rsync
tree
vim
vim-airline
vim-fugitive
vim-gtk
vlc
:-----------------:

config/package-lists/siar.list.chroot
:-----------------:
clonezilla
gparted
lshw
udftools 
:-----------------:

config/package-lists/encryption.list.chroot
:-----------------:
cryptsetup
steghide
:-----------------:

config/package-lists/desktop.list.chroot
:-----------------:
live-task-mate
:-----------------:

config/package-lists/network.list.chroot
:-----------------:
curl
nmap
rclone
task-ssh-server
:-----------------:

config/package-lists/firmware.list.chroot
:-----------------:
firmware-linux-nonfree
firmware-misc-nonfree
firmware-realtek
firmware-atheros
firmware-iwlwifi
:-----------------:
