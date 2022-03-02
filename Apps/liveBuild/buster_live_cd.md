# LIVE-BUILD – HOW TO BUILD AN INSTALLABLE DEBIAN 10 BUSTER LIVE CD
(terkey berger)[https://terkeyberger.wordpress.com/2020/12/23/live-build-how-to-build-an-installable-debian-10-buster-live-cd/]
### December 23, 2020 by shamil

There’s a few utilities out there to build debian and ubuntu installable live cd’s like respin (fork of remastersys) and refracta linux’s special tools. However, I have two problems with these utilities: I’m not a baby, and they are not in the debian repositories (things get a lot easier if you can stick with what’s offered from an official source).

What is in the debian repositories for getting what we want done is a few tools that I don’t feel like mentioning right now other than live-build.

## What is it?
Live-build (formerly live-helper) is a command line tool that contains the components to build a live system from a configuration directory; it is a set of scripts to build debian live system images completely automated, and to customize all aspects of building a Live image. Live-build when installed has three commands it uses: lb clean to clean the chroot environment, lb config for specifying build options, and lb build to start the build. Obviously lb config is going to be the only difficult command.

Let’s get started in your favorite terminal emulator, and work from any directory you want (I’m starting where mate-terminal is dumping me, /home/user).

## Install live-build.
```
$ sudo apt-get update
$ sudo apt-get install live-build; yes we want to install this.
```

## Using live-build.
Now we make a folder for our live cd project to keep everything all nice and in one spot.
```
$ mkdir live
$ cd live
$ sudo lb clean
```

Now we make a script for lb config.
```
$ nano
```

Save this script with whatever name you want except config, or lb config will have a fit not being able to create /usr/lib/live/build/config/common (I named mine tempy).
```
#!/bin/bash

lb config \

--mode debian \
--system live \
--interactive shell \
--distribution buster \
--debian-installer live \
--architecture i386 \
--archive-areas "main contrib non-free" \
--security true \
--updates true \
--binary-images iso-hybrid \
--memtest memtest86+ \
```

## Special considerations:
This script is mostly self explanatory. Of course it’s specifying debian, buster, debian’s live installer, 32 bit (if you want a 64 bit build, change --architecture i386 to --architecture amd64, all areas of repositories, all updates, isohybrid (works on a flash drive with persistence), and memtest86+. But, the weird one is --interactive shell; as part of the build process you’ll be dumped at a chroot environment to configure your new distribution. You’ll want this so you can install packages and make other configurations to the system before it gets squashed down to an iso.

Through much troubleshooting of other lb config options found in it’s manual, I have discovered that other options such as --checksums and --grub-splash don’t work. They are options that need to be fixed (among I imagine to be many others too), but that do have easy work arounds such as…

For --grub-splash, go to /usr/share/live/build/bootloaders, on the system your building the iso (not inside the live-build chroot build environment), and you will see a bunch of folders for bootloader configuration. Go into each folder and delete splash.svg, and replace with whatever image you want as long as it is called splash.png. To create checksum files, use md5sum to generate an md5 checksum after you’ve created some images.

## Back to it.
config needs to become executable.
```
$ chmod 700 tempy
```

Then we execute.
```
./tempy
```

## Let’s build.
```
# lb build
```
Don’t forget that we specified --interactive shell in the script we executed. Entering lb build will start the build process downloading whatever it needs and putting things together, eventually dumping you half way to a chroot environment for more configuration like shown.

We’re going to install packages now. I am just going to use the package list from my distribution for this.
task-ssh-server task-laptop task-print-server xorg kmod laptop-mode-tools cryptsetup live-config systemd tor firmware-linux-nonfree firmware-misc-nonfree firmware-realtek firmware-atheros firmware-iwlwifi firmware-brcm80211 firmware-b43-installer lightdm numlockx mate-desktop-environment-core caja caja-extensions-common dconf-editor caja-open-terminal mate-user-share mate-applets mate-settings-daemon mate-utils mate-control-center mate-notification-daemon gnome-system-tools gnome-multi-writer mate-screensaver mate-power-manager mate-system-monitor ufw openvpn network-manager-gnome samba vinagre hardinfo pavucontrol pluma firefox-esr thunderbird libreoffice-calc libreoffice-writer vlc gimp atril pidgin deluge gparted gdebi brasero engrampa galculator eom synaptic simple-scan system-config-printer grub-pc grub-efi frozen-bubble chromium-bsu quadrapassel gweled audacity xrdp extlinux onboard syslinux mtools bridge-utils live-build exfat-utils exfat-fuse tigervnc-standalone-server virt-manager gnome-disk-utility wireguard

## Special consideration:
Pay close attention and you will see the packages grub-pc and grub-efi. There’s a mismatch of grub bootloader versions in debian 10 that don’t currently allow the grub-pc and grub-efi packages to be installed simultaneously. If you want to prepare an image with efi support, get rid of the grub-pc package. If you want a classic boot image, get rid of the grub-efi package. Debian 10 will not let you install both.

Aside from that, this is also to save time on not needing to find out if the --bootloader option for lb config even works. If we don’t include a boot loader in the packages now, you’ll see that the debian installer from your resulting build not be able to install a boot loader. This is why we include this package here now.

Yes we want to install these packages.

## Other configurations.
Once all packages you wanted are installed, we can finish the build right here. But, you probably don’t want to just yet. I recommend three things. First is inside /etc/Network-manager/Network-manager.conf and changing the managed=false to managed=true so network-manager can manage the network interfaces.

The second, I also recommend configuring the default user parameters of the build. You do this by copying the whole entire contents of a user’s home directory into /live/chroot/etc/skel (hidden folders and all). What I do for this is create a new user on my system, and just configure away; screensaver, power settings, program specifications, theme, etc. Then I harvest the contents of the new user home directory (hidden folders and all; please no personal documents) and plop them all into /live/chroot/etc/skel. The way that you see your desktop, has now been specified in the build for every future user.

The third is installing packages that are not found inside the debian repositories. Again, as hinted upon earlier; we can copy documents to the chroot environment. Once these extra packages are installed, please get rid of the package files as they will show up inside the file structure of your finished product which will make no sense to future users, or yourself if you forgot about it.

You can keep configuring other things if you need; such as rebranding (I don’t care about that here, so I am not focusing on this). However, if you are happy with the way things are, then continue on to the next step.

## Finish build.
```
# exit
```
With this, you will exit the chroot environment and lb build will finish it’s job by downloading whatever extra it needs and eventually squashing your build into a file system, and then containing it inside an iso file.

## Take a look.
```
$ ls
```
When lb build has officially finished, here is the result.

Name your iso, create md5 checksum file, and double check md5 checksum.
```
$ mv live-image-i386.hybrid.iso mybuild.iso
$ md5sum mybuild.iso > mybuild.md5
$ md5sum -c mybuild.md5
$ ls
```

We have renamed the iso, created an md5 checksum file, and have compared the md5 checksum against the iso (which it passed).

## Testing the build
Burn to cd, make a bootable flash drive, or test it out in a virtual machine; I used virtualbox for this.

## It works!
If your custom build works, then good on you! You have created your own customized live cd that can be installed offline. I recommend to keep messing around with live-build with extra focus on the chroot build environment.

