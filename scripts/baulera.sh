#!/bin/sh

case "$1" in
    to)
        echo "sync to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync /home/leandro/Pictures/Baulera onedrive:/Pictures/Baulera
        ;;
    from)
        echo "sync from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync onedrive:/Pictures/Baulera /home/leandro/Pictures/Baulera
        ;;
    dry)
        echo "first to - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync --dry-run /home/leandro/Pictures/Baulera onedrive:/Pictures/Baulera
        echo ""
        echo "then from - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync --dry-run onedrive:/Pictures/Baulera /home/leandro/Pictures/Baulera
        ;;
    *)
        echo "to or from, but first do a dry"
        ;;
esac
