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

echo "Extracting firmware from ${FW_FILE_NAME}..."
7z x "${FW_FILE_DIR}/${FW_FILE_NAME}" -o"${FW_FILE_DIR}"

echo "Cleaning up original archive and text files..."
rm -rf "${FW_FILE_DIR}/${FW_FILE_NAME}"
rm -rf "${FW_FILE_DIR}"/*.txt

echo "🔧 Renaming .md5 files to remove extension..."
for file in "${FW_FILE_DIR}"/*.md5; do
    [ -f "$file" ] && mv -- "$file" "${file%.md5}"
done

echo "Removing unnecessary tar.md5 files..."
rm -f "${FW_FILE_DIR}/BL"*tar.md5
rm -f "${FW_FILE_DIR}/CP"*tar.md5
rm -f "${FW_FILE_DIR}/CSC"*tar.md5
rm -f "${FW_FILE_DIR}/HOME"*tar.md5

echo "Extracting contents of .tar files..."
for file in "${FW_FILE_DIR}"/*.tar; do
    [ -f "$file" ] && tar -xvf "$file" -C "${FW_FILE_DIR}"
done

echo "Keeping only super.img.lz4 and boot.img.lz4..."
find "${FW_FILE_DIR}" -type f \
    ! -name 'super.img.lz4' \
    ! -name 'boot.img.lz4' \
    -delete

echo "Removing leftover .tar files and meta-data..."
rm -rf "${FW_FILE_DIR}"/*.tar
rm -rf "${FW_FILE_DIR}/meta-data"

echo "Decompressing .lz4 images..."
for file in "${FW_FILE_DIR}"/*.lz4; do
    [ -f "$file" ] && lz4 -d "$file" "${file%.lz4}"
done

echo "Removing .lz4 files after decompression..."
rm -rf "${FW_FILE_DIR}"/*.lz4

echo "Converting sparse super.img to raw image..."
simg2img "${FW_FILE_DIR}/super.img" "${FW_FILE_DIR}/super_raw.img"
rm -rf "${FW_FILE_DIR}/super.img"
mv "${FW_FILE_DIR}/super_raw.img" "${FW_FILE_DIR}/super.img"

echo "Unpacking super.img..."
lpunpack -o "${FW_FILE_DIR}" "${FW_FILE_DIR}/super.img"

echo "Final cleanup: removing super.img..."
rm -rf "${FW_FILE_DIR}/super.img"
rm -rf "${FW_FILE_DIR}/vendor_dlkm.img"

echo "Extracting all .img..."
bash ./extract_ext4.sh

echo "✅ Firmware extraction complete."
