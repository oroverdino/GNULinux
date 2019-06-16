#!/usr/bin/sh

case "$1" in
    push)
        echo "sync to drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync /home/leandro/Documents/GNULinux drive:/GNULinux
        ;;
    pull)
        echo "sync from drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync drive:/GNULinux /home/leandro/Documents/GNULinux
        ;;
    check)
        echo "check - - - -- - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P check /home/leandro/Documents/GNULinux drive:/GNULinux
        ;;
    *)
        echo "push or pull, but first check"
        ;;
esac
