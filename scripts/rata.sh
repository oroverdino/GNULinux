#!/usr/bin/bash

case "$1" in
    push)
        echo "push to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync /home/leandro/Documents/ratRace onedrive:/Documentos/ratRace
        ;;
    pull)
        echo "pull from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync onedrive:/Documentos/ratRace /home/leandro/Documents/ratRace
        ;;
    dry)
        echo "first push - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync --dry-run /home/leandro/Documents/ratRace onedrive:/Documentos/ratRace
        echo ""
        echo "then pull - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync --dry-run onedrive:/Documentos/ratRace /home/leandro/Documents/ratRace
        ;;
    *)
        echo "pull or push, but first do a dry"
        ;;
esac
