case "$1" in
    push)
        echo "sync to onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync /home/leandro/Pictures/Baulera onedrive:/Pictures/Baulera
        ;;
    pull)
        echo "sync from onedrive - - - - - - - - - - - - - - - - - - - - - - -"
        rclone -v sync onedrive:/Pictures/Baulera /home/leandro/Pictures/Baulera
        ;;
    dry)
        echo "first push - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync --dry-run /home/leandro/Pictures/Baulera onedrive:/Pictures/Baulera
        echo ""
        echo "then pull - - - - - - - - - - - - - - - - - - - - - - -"
        rclone sync --dry-run onedrive:/Pictures/Baulera /home/leandro/Pictures/Baulera
        ;;
    *)
        echo "push or pull, but first do a dry"
        ;;
esac
