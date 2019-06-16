#!/usr/bin/bash

case "$1" in
    push)
        echo "sync to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync /home/leandro/Documents/Barrio onedrive:Barrio
        ;;
    pull)
        echo "sync from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync onedrive:Barrio /home/leandro/Documents/Barrio
        ;;
    check)
        echo "check - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P check /home/leandro/Documents/Barrio onedrive:Barrio
        ;;
    *)
        echo "push or pull, but first check"
        ;;
esac
