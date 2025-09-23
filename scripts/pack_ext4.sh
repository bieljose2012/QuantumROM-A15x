#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <rom_directory>"
    exit 1
fi

rom_directory="$1"
FW_DIR="../fw_download"
BIN_DIR="../bin"
WORK_DIR="../work"
out_dir="./out"

rm -rf "$out_dir"
mkdir -p "$out_dir"

for folder_path in "$rom_directory"/*; do
    [ -d "$folder_path" ] || continue

    folder_name=$(basename "$folder_path")

    if [ "$folder_name" == "config" ]; then
        echo "Skipping config folder..."
        continue
    fi

    partition_name="$folder_name"
    file_contexts_file="$rom_directory/config/$folder_name/${folder_name}_file_contexts"
    fs_config_file="$rom_directory/config/$folder_name/${folder_name}_fs_config"
    SIZE=$(du -sb "$rom_directory/$folder_name" | awk '{printf "%d", $1 * 1.07}')

    if [ "$folder_name" = "system" ]; then
        mount_point="/"
    else
        mount_point="/$folder_name"
    fi

    echo ""
    echo "Creating $partition_name.img from $folder_path..."
    sort -u "$file_contexts_file" -o "$file_contexts_file"
    sort -u "$fs_config_file" -o "$fs_config_file"
    ./bin/make_ext4fs -J -T -1 \
        -S "$file_contexts_file" \
        -C "$fs_config_file" \
        -l "$SIZE" \
        -L "$mount_point" \
        -a "$partition_name" \
        "$out_dir/$partition_name.img" "$rom_directory/$partition_name"
done
