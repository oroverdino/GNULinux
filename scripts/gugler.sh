#!/usr/bin/bash

case "$1" in
    push)
        echo "push to drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync /home/leandro/Documents/Gugler drive:Gugler
        ;;
    pull)
        echo "pull from drive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync drive:Gugler /home/leandro/Documents/Gugler
        ;;
    check)
        echo "check  - - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync -P check /home/leandro/Documents/Gugler drive:Gugler
        ;;
    *)
        echo "push or pull, but first check"
        ;;
esac
