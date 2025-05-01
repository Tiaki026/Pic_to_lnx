TARGET_DIR="/home/tiaki/Download_pic"
cd "$TARGET_DIR" || exit 1

echo "---Run archive + delete script---"

create_daily_archive() {
    local archive_name="images_daily_$(date +'%Y-%m-%d').tar.gz"

    local folders=(image_*h)
    
    if [ ${#folders[@]} -gt 0 ]; then
        tar -czf "$archive_name" "${folders[@]}"
        echo "Archive --> $archive_name created!"

        for folder in "${folders[@]}"; do
            if [ -d "$folder" ]; then
                rm -rf "${folder:?}"/*
                rmdir "$folder"
                echo "DIR deleted --> $folder"
            fi
        done
    else
        echo "DIRS NOT FOUND FOR ARHIVE!"
    fi
}

create_daily_archive