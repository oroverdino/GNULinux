#!/usr/bin/bash

case "$1" in
    push)
        echo "sync to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync /home/leandro/Documents/SADIO onedrive:Documentos/SADIO
        ;;
    pull)
        echo "sync from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync onedrive:Documentos/SADIO /home/leandro/Documents/SADIO
        ;;
    check)
        echo "check - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync /home/leandro/Documents/SADIO onedrive:Documentos/SADIO
        ;;
    *)
        echo "push or pull, but first check"
        ;;
esac
