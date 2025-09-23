#!/bin/bash
# extract_firmware.sh
# Usage: bash extract_firmware.sh file_location file_name

set -e
set -u

if [ "$#" -ne 2 ]; then
    echo "Usage: bash $0 file_location file_name"
    exit 1
fi

FW_DIR="../fw_download"
BIN_DIR="../bin"
WORK_DIR="../work"
OUT_DIR="../out"

FW_FILE_LOCATION=$1
FW_FILE_NAME=$2
FW_FILE_DIR="${FW_DIR}/${FW_FILE_LOCATION}"

echo "Extracting firmware from ${FW_FILE_NAME}..."
7z x "${FW_FILE_DIR}/${FW_FILE_NAME}" -o"${FW_FILE_DIR}"

# Cleaning up original archive and text files.
rm -f "${FW_FILE_DIR}/${FW_FILE_NAME}"
rm -f "${FW_FILE_DIR}"/*.txt

# Renaming .md5 files to remove extension.
for file in "${FW_FILE_DIR}"/*.md5; do
    [ -f "$file" ] && mv -- "$file" "${file%.md5}"
done

echo "Extracting tar files..."
for file in "${FW_FILE_DIR}"/*.tar; do
    [ -f "$file" ] && tar -xvf "$file" -C "${FW_FILE_DIR}"
    [ -f "$file" ] && rm -f "$file"
done

# Keeping only super.img.lz4 and boot.img.lz4.
find "${FW_FILE_DIR}" -type f \
    ! -name 'super.img.lz4' \
    ! -name 'boot.img.lz4' \
    -delete

echo "Decompressing .lz4 images..."
for file in "${FW_FILE_DIR}"/*.lz4; do
    [ -f "$file" ] && lz4 -d "$file" "${file%.lz4}"
done

# Clean up .lz4 files and metadata after decompression
rm -f "${FW_FILE_DIR}"/*.lz4
rm -rf "${FW_FILE_DIR}/meta-data"

echo "Converting sparse super.img to raw image..."
simg2img "${FW_FILE_DIR}/super.img" "${FW_FILE_DIR}/super_raw.img"
rm -f "${FW_FILE_DIR}/super.img"
mv "${FW_FILE_DIR}/super_raw.img" "${FW_FILE_DIR}/super.img"

echo "Unpacking super.img..."
lpunpack -o "${FW_FILE_DIR}" "${FW_FILE_DIR}/super.img"
rm -f "${FW_FILE_DIR}/super.img"
rm -f "${FW_FILE_DIR}/vendor_dlkm.img"

echo "Extracting all .img..."
sudo bash "$(pwd)/scripts/extract_ext4.sh" "$FW_FILE_DIR"

echo "✅ Firmware extraction complete."
