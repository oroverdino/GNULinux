#!/bin/sh

case "$1" in
    to)
        echo "sync to drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync /home/leandro/Documents/Barrio drive:/Barrio
        ;;
    from)
        echo "sync from drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync drive:/Barrio /home/leandro/Documents/Barrio
        ;;
    dry)
        echo "first to - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync --dry-run /home/leandro/Documents/Barrio drive:/Barrio
        echo ""
        echo "then from - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync --dry-run drive:/Barrio /home/leandro/Documents/Barrio
        ;;
    *)
        echo "to or from, but first do a dry"
        ;;
esac
