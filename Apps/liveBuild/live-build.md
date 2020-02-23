# Live [live-build](https://live-team.pages.debian.net/live-manual/html/live-manual/index.en.html)
### 200207

## Install

```
# aptitude install live-build
```

## lb config

### auto/config

```
#!/bin/sh

set -e

lb config noauto \
    --mode debian \
    --distribution buster \
    --architectures amd64 \
    --debian-installer false \
    --archive-areas "main contrib non-free" \
    --apt aptitude \
    --apt-indices false \
    --memtest none \
    --bootappend-live "boot=live components keyboard-layouts=us keyboard-variants=dvorak \
                       persistence persistence-encryption=luks"
    "${@}"
```

## Basic packages

The list is a file whith the names of the packages.

For example:

config/package-lists/lmt.list.chroot
:-----------------:
aptitude
arc-theme
cups
expect
git
highlight
nmon
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
