# Debian Live Persistente en un USB

Well, I went back to Ben Armstrong's tutorial and modified it so it would work for me. I'll post this here to get some confirmation that it works for others before reposting it in the Tutorials forum. I did this from a Debian jessie desktop, I'd love it if someone with a Waldorf or other wheezy system tested this. This is a bit long but it's not complicated. Just be sure to always use the USB drive letter for your drive. If you do a command to /dev/sda, you'll most likely be in a world of pain.

 Create a Debian Live 8.1 (jessie) USB with Persistence

You'll need any jessie Live ISO and a USB key of 8G minimum.

You'll also need the following packages...

- gparted
- mbr
- syslinux
- p7zip

## Partition the USB Drive

Open gparted, go to the drive drop-down menu in the upper-right corner (/dev/sda (x.x GiB) and choose your USB drive. Make sure any existing partitions on it are unmounted. If the drive size is 300 GiB, that's probably not the drive you want, monkey.

Here we delete all contents on the drive!!! From the menu bar, choose Device>Create Partition Table...>msdos>Apply. Bye-bye drive contents!

Create a bootable fat32 partition large enough to hold your ISO, plus additional space in case a kernel upgrade becomes available (-edit- I have no idea how to make the USB "see" a new kernel if it gets installed. /edit); Ben Armstrong recommends an additional 5%. The ISO I'm using is about 845MB so 1G (1024MB) should be plenty... Right-click the "unallocated" bar>New>New Size (MiB):>1024, Create as:>Primary Partition, File System:>fat32, Add. Click the giant green checkmark in the toolbar at the top of the window and Apply. Now right-click that partition, choose Manage Flags and check "boot".

Right-click "unallocated" again and create an ext4 file system in the remaining space and in the "Label:" field type in "persistence" w/out quotes. Spell it right, please. tongue Add and Apply.

You should now have 2 partitions, /dev/sdX1, a fat32 partition with the Flag "boot" and /dev/sdX2, an ext4 partition with the Label "persistence". Close gparted.

## Set Up the Master Boot Record

Make sure you use the right drive letter so you don't overwrite an existing mbr, like the one on your hard drive!!!
Open a terminal and enter the following
```
# /sbin/install-mbr /dev/sdX
```

That installs the MBR to the first sector of the drive, hence no number after the drive letter. Then
```
# syslinux -i /dev/sdX1
```

## Extract the ISO to the First Partition

Mount the partition to a directory, I use /mnt because it's empty.
```
# mount /dev/sdX1 /mnt
```

Extract the ISO with p7zip. Mine is in ~/Documents and is named bl-live-rc1-i386.hybrid.iso, so
```
# cd /mnt
# 7z x /home/hhh/Documents/bl-live-rc1-i386.hybrid.iso
```

Adjust your path and ISO name, of course. The extraction will take a few to several minutes.

## Set Up Persistence

We're almost done. We need to rename some things and append the live boot parameters to make sure the ISO boots and is persistent. Run these commands, one at a time
```
# mv isolinux syslinux
# mv syslinux/isolinux.cfg syslinux/syslinux.cfg
# mv syslinux/isolinux.bin syslinux/syslinux.bin
# sed -i 's/\(append boot=.*\)$/\1 persistence/' syslinux/live.cfg
# cd ..
# umount /mnt
```

Now we create the persistence.conf file in the second partition
```
# mount /dev/sdX2 /mnt
# cd /mnt
# echo / union | tee persistence.conf
```

That's it. Set your Thunar preferences back to how you had the, reboot to your USB drive and choose a Live session. You'll see messages about your drives not mounting to /live/persistence, that's normal. The first time you boot, you'll see a brief cron job running, that's the persistence being configured.

If you get a message that the USB is unbootable, boot back into your OS, re-insert the USB and run the following command, it may fix the issue
```
# syslinux -i /dev/sdX1 -d /syslinux
```

More discussion on this tutorial is being continued at this thread on the BunsenLabs forums...
https://forums.bunsenlabs.org/viewtopic.php?pid=6886

You should be automatically logged into the session. If you want to log out, the username is user and the password is live. You should be able to change those settings, because we now have a persistent USB! Make some changes to your desktop (maybe set your time zone with 'sudo dpkg-reconfigure tzdata') and reboot to check if persistence is working.

I did these steps again as I was writing this, give me 10 minutes to check that I did everything right before trying this, I'll post back then.

Cheers!

### Disable user autologin

First create root password, then to disable the graphical login, edit
```
$ sudo vim /etc/lightdm/lightdm.conf
```

Change the line `autologin-user=user` to `autologin-user=` 
and uncomment `greeter-show-manual-login=true`

Remember
> user: user
> password: live
