case "$1" in
    push)
        echo "sync to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync --exclude-if-present=.ignore /home/leandro/Documents/TUPED onedrive:TUPED
        ;;
    pull)
        echo "sync from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync --exclude-if-present=.ignore onedrive:TUPED /home/leandro/Documents/TUPED
        ;;
    check)
        echo "check onedrive- - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P check --exclude-if-present=.ignore /home/leandro/Documents/TUPED onedrive:TUPED
        ;;
    *)
        echo "push or pull, but first check"
        ;;
esac
