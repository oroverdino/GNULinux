#!/bin/sh

case "$1" in
    to)
        echo "sync to drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync /home/leandro/Documents/GNULinux drive:/GNULinux
        ;;
    from)
        echo "sync from drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync drive:/GNULinux /home/leandro/Documents/GNULinux
        ;;
    dry)
        echo "first to - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync --dry-run /home/leandro/Documents/GNULinux drive:/GNULinux
        echo ""
        echo "then from - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync --dry-run drive:/GNULinux /home/leandro/Documents/GNULinux
        ;;
    *)
        echo "to or from, but first do a dry"
        ;;
esac
