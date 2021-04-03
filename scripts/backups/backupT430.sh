#!/bin/bash
#
# Mount the destination in /mnt
# 
# ```
# # mount /dev/sdb1 /mnt
# # ./backupT430.sh /mnt/LEANDRO/BACKUP/debianT430/
# ```
#
# january 2020

rsync -avHX --delete --info=stats2,progress2 --exclude-from=/root/exclusiones / $1
