#!/bin/sh

case "$1" in
    to)
        echo "sync to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync /home/leandro/Documents/Fiat147 onedrive:/Documentos/Fiat147
        ;;
    from)
        echo "sync from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync onedrive:/Documentos/Fiat147 /home/leandro/Documents/Fiat147
        ;;
    dry)
        echo "first to - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync --dry-run /home/leandro/Documents/Fiat147 onedrive:/Documentos/Fiat147
        echo ""
        echo "then from - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync --dry-run onedrive:/Documentos/Fiat147 /home/leandro/Documents/Fiat147
        ;;
    *)
        echo "to or from, but first do a dry"
        ;;
esac
