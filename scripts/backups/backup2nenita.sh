#!/bin/bash
#
# Mount the source in /mnt
# 
# ```
# # mount /dev/sda1 /mnt
# # ./backup2nenita.sh /mnt/home/leandro/
# ```
# oct 2021

echo "15 segundos para:"
echo "rsync $1 /media/user/Meteorito/"

sleep 15

#rsync -avHX --delete --delete-excluded --info=stats2,progress2 --exclude-from=/mnt/root/exclusionesHome $1 /home/user/
rsync -avHX --delete --delete-excluded --info=stats2,progress2 --exclude-from=/mnt/root/exclusionesHome $1 /media/user/Meteorito/
