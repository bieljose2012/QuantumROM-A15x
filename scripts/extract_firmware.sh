#!/bin/bash
# extract_firmware.sh
# Usage: bash extract_firmware.sh file_location file_name

if [ "$#" -ne 2 ]; then
    echo "Usage: bash $0 file_location file_name"
    exit 1
fi

FW_FILE_LOCATION=$1
FW_FILE_NAME=$2
FW_FILE_DIR="Firmware_Download/${FW_FILE_LOCATION}"

# Extract firmware
7z x "${FW_FILE_DIR}/${FW_FILE_NAME}" -o"${FW_FILE_DIR}"
rm -rf "${FW_FILE_DIR}/${FW_FILE_NAME}"
rm -rf "${FW_FILE_DIR}"/*.txt

# Rename *.md5 to remove extension
for file in "${FW_FILE_DIR}"/*.md5; do
    [ -f "$file" ] && mv -- "$file" "${file%.md5}"
done

# Remove unnecessary files
rm -f "${FW_FILE_DIR}/BL"*tar.md5
rm -f "${FW_FILE_DIR}/CP"*tar.md5
rm -f "${FW_FILE_DIR}/CSC"*tar.md5
rm -f "${FW_FILE_DIR}/HOME"*tar.md5

# Extract all .tar files
for file in "${FW_FILE_DIR}"/*.tar; do
    [ -f "$file" ] && tar -xvf "$file" -C "${FW_FILE_DIR}"
done

# Keep only selected .lz4 files
find "${FW_FILE_DIR}" -type f \
    ! -name 'super.img.lz4' \
    ! -name 'boot.img.lz4' \
    -delete

rm -rf "${FW_FILE_DIR}"/*.tar
rm -rf "${FW_FILE_DIR}/meta-data"

# Decompress .lz4 images
for file in "${FW_FILE_DIR}"/*.lz4; do
    [ -f "$file" ] && lz4 -d "$file" "${file%.lz4}"
done

rm -rf "${FW_FILE_DIR}"/*.lz4

# Convert sparse image to raw
simg2img "${FW_FILE_DIR}/super.img" "${FW_FILE_DIR}/super_raw.img"
rm -rf "${FW_FILE_DIR}/super.img"
mv "${FW_FILE_DIR}/super_raw.img" "${FW_FILE_DIR}/super.img"

# Unpack super image
lpunpack -o "${FW_FILE_DIR}" "${FW_FILE_DIR}/super.img"
rm -rf "${FW_FILE_DIR}/super.img"
rm -rf "${FW_FILE_DIR}/vendor_dlkm.img"
