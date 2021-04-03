# Live [live-build](https://live-team.pages.debian.net/live-manual/html/live-manual/index.en.html)
### 210122

## Install

```
# aptitude install live-build
```

## Steps

1. mkdir live_greta && cd live_greta
2. lb config
3. copy auto/config, skel and bootloaders {isolinux, syslinux}
4. lb clean && lb config
5. lb build


### auto/config

```
#!/bin/bash

lb config noauto \
    --mode debian \
    --binary-images iso-hybrid \
    --iso-application Greta \
    --iso-volume Greta \
    --distribution buster \
    --architectures amd64 \
    --linux-flavours amd64 \
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
