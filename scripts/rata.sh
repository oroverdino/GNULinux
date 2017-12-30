#!/bin/sh

case "$1" in
    to)
        echo "copy to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v copy /home/leandro/Documents/rata.ods onedrive:/Documentos
        ;;
    from)
        echo "copy from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v copy onedrive:/Documentos/rata.ods /home/leandro/Documents
        ;;
    dry)
        echo "first to - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v copy --dry-run /home/leandro/Documents/rata.ods onedrive:/Documentos
        echo ""
        echo "then from - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v copy --dry-run onedrive:/Documentos/rata.ods /home/leandro/Documents
        ;;
    *)
        echo "to or from, but first do a dry"
        ;;
esac
