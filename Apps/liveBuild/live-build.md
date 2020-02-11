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

For example: config/package-lists/my.list.chroot
:-----------------:
aptitude
arc-theme
clonezilla
curl
git
gparted
lshw
nmap
nmon
ranger
rclone
rsync
tree
udftools
vim
vim-airline
vlc
:-----------------:

config/package-lists/encryption.list.chroot
```
cryptsetup
```

config/package-lists/desktop.list.chroot
```
live-task-mate
```

The metapackages suggested:
> task-laptop
> live-task-standard
> live-task-recommended
> task-desktop
> task-ssh-server
> task-mate-desktop
> live-task-base
> live-task-mate

