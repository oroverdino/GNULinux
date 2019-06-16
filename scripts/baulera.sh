case "$1" in
    push)
        echo "sync to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync /home/leandro/Pictures/Baulera onedrive:/Pictures/Baulera
        ;;
    pull)
        echo "sync from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P sync onedrive:/Pictures/Baulera /home/leandro/Pictures/Baulera
        ;;
    check)
        echo "check onedrive- - - - - - - - - - - - - - - - - - - - - - -"
        rclone -P check /home/leandro/Pictures/Baulera onedrive:/Pictures/Baulera         ;;
    *)
        echo "push or pull, but first check"
        ;;
esac
