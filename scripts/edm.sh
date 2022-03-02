#!/usr/bin/bash

case "$1" in
    push)
        echo "sync to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync --exclude-if-present=.ignore /home/leandro/Documents/TUPED/EDM fiuner:EDM
        ;;
    pull)
        echo "sync from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync --exclude-if-present=.ignore fiuner:EDM /home/leandro/Documents/TUPED/EDM
        ;;
    check)
        echo "check - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P check --exclude-if-present=.ignore fiuner:EDM /home/leandro/Documents/TUPED/EDM
        ;;
    *)
        echo "push or pull, but first check"
        ;;
esac
