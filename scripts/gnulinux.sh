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
    dry)
        echo "first push - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync --dry-run /home/leandro/Documents/GNULinux drive:/GNULinux
        echo ""
        echo "then pull - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync --dry-run drive:/GNULinux /home/leandro/Documents/GNULinux
        ;;
    *)
        echo "push or pull, but first do a dry"
        ;;
esac
