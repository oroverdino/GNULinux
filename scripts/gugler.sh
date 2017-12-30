#!/bin/sh

case "$1" in
    to)
        echo "sync to drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync /home/leandro/Documents/Gugler drive:/Gugler
        ;;
    from)
        echo "sync from drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync drive:/Gugler /home/leandro/Documents/Gugler
        ;;
    dry)
        echo "first to - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync --dry-run /home/leandro/Documents/Gugler drive:/Gugler
        echo ""
        echo "then from - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync --dry-run drive:/Gugler /home/leandro/Documents/Gugler
        ;;
    *)
        echo "to or from, but first do a dry"
        ;;
esac
