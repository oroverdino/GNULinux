# Create udf filesystem in USB

1. install the proper package
```
# aptitude update && aptitude install -y udftools
```

2. find and wipe the first sector of the usb stick (/dev/sdX), or erase to
zero the entire usb stick
```
# lsblk -fa
# umount /media/leandro/kingston
# dd if=/dev/zero of=/dev/sdX bs=512 count=1
```

3. format the usb stick
```
mkudffs --media-type=hd --blocksize=512 --label=DT106 /dev/sdX
```
where:
> --media-type=hd because we want write an erase data in the usb stick
> --blocksize=512 because that's the block size of an usb stick

# Update

Install the package and do the rest with gparted.
