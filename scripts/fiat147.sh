#!/bin/sh

case "$1" in
    push)
        echo "sync to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync /home/leandro/Documents/Fiat147 onedrive:/Documentos/Fiat147
        ;;
    pull)
        echo "sync from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync onedrive:/Documentos/Fiat147 /home/leandro/Documents/Fiat147
        ;;
    check)
        echo "check onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P check /home/leandro/Documents/Fiat147 onedrive:/Documentos/Fiat147
       ;;
    *)
        echo "push or pull, but first check"
        ;;
esac
