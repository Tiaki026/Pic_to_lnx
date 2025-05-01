TARGET_DIR="/home/tiaki/Download_pic"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR" || exit 1

IMAGE_COUNT=15
DELAY_SECONDS=5

get_current_time_folder() {
    local current_hour=$(date +"%H")
    echo "image_${current_hour}h"
}

echo "---Run download script---"

download_images() {
    local folder="$1"
    mkdir -p "$folder"

    for ((i = 0; i < IMAGE_COUNT; i++)); do
        api_response=$(curl -s "https://api.thecatapi.com/v1/images/search")
        if [ $? -ne 0 ]; then
            echo "API Error: Failed to get response"
            continue
        fi

        image_url=$(echo "$api_response" | jq -r '.[0].url')
        if [ -z "$image_url" ]; then
            echo "Error: Could not extract image URL"
            continue
        fi

        filename="${TARGET_DIR}/${folder}/image_$((i + 1))_$(date +%s).jpg"

        curl -s -o "$filename" "$image_url"
        if [ $? -eq 0 ]; then
            echo "Downloaded $((i + 1))/$IMAGE_COUNT --> $filename"
        else
            echo "Download failed for image $((i + 1))"
        fi

        if [ $i -lt $((IMAGE_COUNT - 1)) ]; then
            sleep "$DELAY_SECONDS"
        fi
    done
}

main() {
    current_folder=$(get_current_time_folder)
    echo "Working directory: $current_folder"
    download_images "$current_folder"
}

main