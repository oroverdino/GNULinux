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
    dry)
        echo "first to - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync --dry-run /home/leandro/Documents/Barrio onedrive:Barrio
        echo ""
        echo "then from - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync --dry-run onedrive:Barrio /home/leandro/Documents/Barrio
        ;;
    *)
        echo "push or pull, but first do a dry"
        ;;
esac
