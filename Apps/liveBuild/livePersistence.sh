#!/bin/bash

# porque puto hay en todas partes
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

function pauseNdone(){
    sleep 1
    printf "${GREEN}done${NORMAL}"
    printf "\n\n"
}

function goOn(){
    read -p 'Press ENTER to continue...' variableInutil
    printf "\n\n"
}

function getPendrive(){
    #lsblk #| pv -qL64
    ls -1 /dev/disk/by-id
    printf "${RED}So, which device you are going to use? Example: sdb${NORMAL}\n"
    read -p '/dev/?: ' PENDRIVE
}

function setPartitions(){
    mapfile -t <particionado.txt
    for arg in "${MAPFILE[@]}"
    do
        printf "${RED}%s\n${NORMAL}" "-> parted /dev/$PENDRIVE --script $arg"
        parted /dev/$PENDRIVE --script $arg
        pauseNdone
    done
}

function setFS(){
    printf "${LIME_YELLOW}-> mkfs.vfat -n EFI /dev/${PENDRIVE}1\n${NORMAL}"
    mkfs.vfat -n EFI /dev/${PENDRIVE}1
    pauseNdone

    printf "${LIME_YELLOW}-> mkfs.vfat -n LIVE /dev/${PENDRIVE}2\n${NORMAL}"
    mkfs.vfat -n LIVE /dev/${PENDRIVE}2
    pauseNdone

    printf "${LIME_YELLOW}-> mkfs.ext4 -F -L persistence /dev/${PENDRIVE}3\n${NORMAL}"
    mkfs.ext4 -F -L persistence /dev/${PENDRIVE}3
    pauseNdone
}

function mounting(){
    usbEFI=`mktemp -d`
    usbLIVE=`mktemp -d`
    usbPERSISTENCE=`mktemp -d`
    ISO=`mktemp -d`

    printf "${YELLOW}-> mount /dev/%s1 %s\n${NORMAL}" $PENDRIVE usbEFI
    mount /dev/${PENDRIVE}1 $usbEFI
    pauseNdone

    printf "${YELLOW}-> mount /dev/%s2 %s\n${NORMAL}" $PENDRIVE usbLIVE
    mount /dev/${PENDRIVE}2 $usbLIVE
    pauseNdone

    printf "${YELLOW}-> mount /dev/%s3 %s\n${NORMAL}" $PENDRIVE usbPERSISTENCE
    mount /dev/${PENDRIVE}3 $usbPERSISTENCE
    pauseNdone

    printf "${YELLOW}-> mount -oro %s %s\n${NORMAL}" $HYBRID ISO
    while [ ! -f "$HYBRID" ]
    do
        read -p 'live-hybrid.iso: ' HYBRID
    done
    mount -oro $HYBRID $ISO
    pauseNdone
}

function installLive(){
    printf "${BLUE}-> rsync -ah --progress %s/ %s/\n${NORMAL}" $ISO $usbLIVE
    rsync -ah --progress $ISO/ $usbLIVE/
}

function setPersistence(){
    printf "${CYAN}-> echo \"/ union\" > %s/persistence.conf\n${NORMAL}" usbPERSISTENCE
    echo "/ union" > $usbPERSISTENCE/persistence.conf
}

function setUEFI(){
    printf "${LIME_YELLOW}-> grub-install --removable --target=x86_64-efi --boot-directory=%s/boot/ --efi-directory=%s /dev/%s\n${NORMAL}" usbLIVE usbEFI PENDRIVE
    grub-install --removable --target=x86_64-efi --boot-directory=$usbLIVE/boot/ --efi-directory=$usbEFI /dev/$PENDRIVE
}

function setBIOS(){
    printf "${BLUE}-> dd bs=440 count=1 conv=notrunc if=/usr/lib/syslinux/mbr/gptmbr.bin of=/dev/%s\n${NORMAL}" $PENDRIVE
    dd bs=440 count=1 conv=notrunc if=/usr/lib/syslinux/mbr/gptmbr.bin of=/dev/$PENDRIVE

    printf "${BLUE}syslinux --install /dev/%s2\n${NORMAL}" $PENDRIVE
    syslinux --install /dev/${PENDRIVE}2
}

function reuseIsolinux(){
    printf "${BLUE}-> mv %s/isolinux %s/syslinux\n${NORMAL}" usbLIVE usbLIVE
    mv $usbLIVE/isolinux $usbLIVE/syslinux

    printf "${BLUE}-> mv %s/syslinux/isolinux.bin %s/syslinux/syslinux.bin\n${NORMAL}" usbLIVE usbLIVE
    mv $usbLIVE/syslinux/isolinux.bin $usbLIVE/syslinux/syslinux.bin

    printf "${BLUE}-> mv %s/syslinux/isolinux.cfg %s/syslinux/syslinux.cfg\n${NORMAL}" usbLIVE usbLIVE
    mv $usbLIVE/syslinux/isolinux.cfg $usbLIVE/syslinux/syslinux.cfg
}

function kernelParams(){
    printf "${YELLOW}-> sed --in-place '0,/boot=live/{s/\(boot=live .*\)$/\1 persistence/}' %s/boot/grub/grub.cfg %s/syslinux/menu.cfg\n${NORMAL}" usbLIVE usbLIVE
    sed --in-place '0,/boot=live/{s/\(boot=live .*\)$/\1 persistence/}' $usbLIVE/boot/grub/grub.cfg $usbLIVE/syslinux/menu.cfg

    printf "${CYAN}-> sed --in-place 's#isolinux/splash#syslinux/splash#' %s/boot/grub/grub.cfg\n${NORMAL}" usbLIVE
    sed --in-place 's#isolinux/splash#syslinux/splash#' $usbLIVE/boot/grub/grub.cfg
}

function main(){
    printf "Check wich device will be writen.\n\n" 
    printf "${RED}BE CAREFULL${NORMAL}\n\n"
    goOn
    getPendrive

    printf "We need an EFI boot partition for UEFI PCs to boot from the USB drive.
    Then we need a sufficiently large partition to hold the original live ISO 
    filesystem image contents.
    That partition must have the ${UNDERLINE}legacy_boot${NORMAL} flag set.

    Then we add the persistence partition, using up all the remaining space
    of the USB drive. You can do that with any GPT capable partitioning tool.

    So, create a gpt partition table and a protective mbr partition table:\n"
    goOn
    setPartitions

    printf "The persistence feature requires ext4 and ${UNDERLINE}persistence${NORMAL} as a label.
    The EFI needs FAT.
    (The last step takes a while, be patience.)\n"
    goOn
    setFS

    printf "Mount the resources.\n"
    goOn
    mounting

    printf "Install the live system.\n"
    goOn
    installLive

    printf "The persistence won't work without this file:\n"
    setPersistence
    goOn

    printf "Install grub2 for UEFI booting support, this requires the ${UNDERLINE}grub-efi-amd64-bin${NORMAL} package on Debian.\n"
    goOn
    setUEFI

    printf "Install syslinux gptmbr.bin bootloader to the drive (download syslinux or install package syslinux-common).
    Then install syslinux to the live partition.\n"
    goOn
    setBIOS

    printf "Then reuse the isolinux config of the original live ISO to work with syslinux.\n"
    goOn
    reuseIsolinux

    printf "Now that we copied the live system files to an actual read-write filesystem,
    we can manipulate the grub and syslinux config.

    Add the persistence kernel parameter to menu.cfg and grub.cfg. In both files,
    add the keyword persistence at the end of the respective first line with boot=live in it.\n"
    goOn
    kernelParams

    exit 0
}

main
printf "\n"

