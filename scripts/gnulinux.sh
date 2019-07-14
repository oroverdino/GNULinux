#!/usr/bin/bash

case "$1" in
    push)
        echo "sync to drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync --exclude-if-present=.ignore /home/leandro/Documents/GNULinux drive:/GNULinux
        ;;
    pull)
        echo "sync from drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync --exclude-if-present=.ignore drive:/GNULinux /home/leandro/Documents/GNULinux
        ;;
    check)
        echo "check - - - -- - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P check --exclude-if-present=.ignore /home/leandro/Documents/GNULinux drive:/GNULinux
        ;;
    *)
        echo "push or pull, but first check"
        ;;
esac
