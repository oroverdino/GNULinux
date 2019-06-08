#!/usr/bin/bash

case "$1" in
    push)
        echo "push to drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync /home/leandro/Documents/Gugler drive:/Gugler
        ;;
    pull)
        echo "pull from drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync drive:/Gugler /home/leandro/Documents/Gugler
        ;;
    dry)
        echo "first to - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync --dry-run /home/leandro/Documents/Gugler drive:/Gugler
        echo ""
        echo "then from - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync --dry-run drive:/Gugler /home/leandro/Documents/Gugler
        ;;
    *)
        echo "push or pull, but first do a dry"
        ;;
esac
