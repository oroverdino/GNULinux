#!/usr/bin/bash

case "$1" in
    push)
        echo "push to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync --exclude-if-present=.ignore /home/leandro/Documents/ratRace onedrive:ratRace
        ;;
    pull)
        echo "pull from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync --exclude-if-present=.ignore onedrive:ratRace /home/leandro/Documents/ratRace
        ;;
    check)
        echo "check - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P check --exclude-if-present=.ignore /home/leandro/Documents/ratRace onedrive:ratRace
        ;;
    *)
        echo "pull or push, but first check"
        ;;
esac
