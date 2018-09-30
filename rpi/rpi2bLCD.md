# Raspbian Lite to Pixel
### 180930

### Clonning

Before the installation from the ground, perhaps we should clone it from
the backup made right after the full configuration, where

* pi::rpi2 - root::admin

The 5" LCD screen touch is rightly configurated, some services were
disabled:
* apt-daily
* apt-daily-upgrade
* bluetooth

For creating the image
```
# dd bs=4M if=/dev/mmcblk0 | gzip > raspbianRDP.img.gz
```

To restore
```
# gzip -dc raspbianRDP.img.gz | dd bs=4M of=/dev/mmcblk0
```

## Setting the basics

I stole the instruction from [here](www.raspberrypi.org/forums/viewtopic.php?t=133691). The basics:

1. Download and extract the raspbian-lite's image

Clone it
2. # dd bs=4M if=raspbian-lite.img of=/dev/mmcblk0 status=progress

Boot it and configure the wifi, the locals and spare the disk
3. $ sudo raspi-config

Let's make nice
4. sudo apt-get install --no-install-recommends xserver-xorg
5. sudo apt-get install --no-install-recommends raspberrypi-ui-mods lxsession
6. sudo apt-get install pi-greeter rpd-icons gtk2-engines-clearlookspix
