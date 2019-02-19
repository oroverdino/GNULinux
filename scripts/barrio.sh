#!/bin/bash

case "$1" in
    push)
        echo "sync to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync /home/leandro/Documents/Barrio onedrive:Barrio
        ;;
    pull)
        echo "sync from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync onedrive:Barrio /home/leandro/Documents/Barrio
        ;;
    dry)
        echo "first to - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync --dry-run /home/leandro/Documents/Barrio onedrive:Barrio
        echo ""
        echo "then from - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync --dry-run onedrive:Barrio /home/leandro/Documents/Barrio
        ;;
    *)
        echo "to or from, but first do a dry"
        ;;
esac
