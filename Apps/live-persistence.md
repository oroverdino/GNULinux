### Live Persistence
[stackexchange](https://unix.stackexchange.com/questions/382817/uefi-bios-bootable-live-debian-stretch-amd64-with-persistence)

# Preparations

After download the last *live* version of Debian, you should check
wich device is, for that you has lsblk command.

## Create partitions

First of all, unmount all the partitions of the target device; we'll
call it from here */dev/sdX*.

We need an EFI boot partition for UEFI PCs to boot from the USB drive.
Then we need a sufficiently large partition to hold the original live ISO 
filesystem image contents. That partition must have the *legacy_boot* flag set.
Then we add the persistence partition, using up all the remaining space
of the USB drive. You can do that with any GPT capable partitioning tool.

So, create a gpt partition table and a protective mbr partition table:
```
parted /dev/sdX --script mktable gpt
parted /dev/sdX --script mkpart EFI fat16 1MiB 10MiB
parted /dev/sdX --script mkpart live fat16 10MiB 3GiB
parted /dev/sdX --script mkpart persistence ext4 3GiB 100%
parted /dev/sdX --script set 1 msftdata on
parted /dev/sdX --script set 2 legacy_boot on
parted /dev/sdX --script set 2 msftdata on
```

## Create the filesystem

The persistence feature requires ext4 and *persistence* as a label.
The EFI needs FAT. (The last step takes a while, be patience.)
```
mkfs.vfat -n EFI /dev/sdX1
mkfs.vfat -n LIVE /dev/sdX2
mkfs.ext4 -F -L persistence /dev/sdX3
```

Mounting the resources is the last step before install the live system
```
mkdir /tmp/usb-efi /tmp/usb-live /tmp/usb-persistence /tmp/live-iso
mount /dev/sdX1 /tmp/usb-efi
mount /dev/sdX2 /tmp/usb-live
mount /dev/sdX3 /tmp/usb-persistence
mount -oro live.iso /tmp/live-iso
```

# Install the live system

Now copy the live iso filesystem content to the live partition
```
cp -ar /tmp/live-iso/* /tmp/usb-live
```

## The persistence

The persistence won't work without this file:
```
echo "/ union" > /tmp/usb-persistence/persistence.conf
```

Check before test the live image if persistence.conf exists
in /tmp/usb-persistence. If the persistence feature doesn't work is
because the file was not created.

## UEFI support

Install grub2 for UEFI booting support, this requires the *grub-efi-amd64-bin*
package on Debian.
```
grub-install --removable --target=x86_64-efi --boot-directory=/tmp/usb-live/boot/ --efi-directory=/tmp/usb-efi /dev/sdX
```

## legacy BIOS support

Install syslinux gptmbr.bin bootloader to the drive (download syslinux or 
install package syslinux-common). Then install syslinux to the live partition.
```
dd bs=440 count=1 conv=notrunc if=/usr/lib/syslinux/mbr/gptmbr.bin of=/dev/sdX
syslinux --install /dev/sdX2
```

Then reuse the isolinux config of the original live ISO to work with syslinux:
```
mv /tmp/usb-live/isolinux /tmp/usb-live/syslinux
mv /tmp/usb-live/syslinux/isolinux.bin /tmp/usb-live/syslinux/syslinux.bin
mv /tmp/usb-live/syslinux/isolinux.cfg /tmp/usb-live/syslinux/syslinux.cfg
```

## Kernel parameters

Now that we copied the live system files to an actual read-write filesystem,
we can manipulate the grub and syslinux config.

Add the persistence kernel parameter to menu.cfg and grub.cfg. In both files,
add the keyword persistence at the end of the respective first line with boot=live in it.
```
sed --in-place '0,/boot=live/{s/\(boot=live .*\)$/\1 persistence/}' /tmp/usb-live/boot/grub/grub.cfg /tmp/usb-live/syslinux/menu.cfg
```

# Grub splash

```
sed --in-place 's#isolinux/splash#syslinux/splash#' /tmp/usb-live/boot/grub/grub.cfg
```
