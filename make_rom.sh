#!/bin/bash
set -e

if [ "$#" -ne 3 ]; then
    echo "Usage: bash $0 MODEL CSC IMEI"
    exit 1
fi

MODEL=$1
CSC=$2
IMEI=$3
FW_DIR="fw_download"


# --- Setup Directories ---
chmod +x ./scripts/download_firmware.sh
bash ./scripts/setup_directories.sh


# --- Start firmware download ---
bash ./scripts/download_firmware.sh "$MODEL" "$CSC" "$IMEI" "$MODEL"


# --- Extract Firmware ---
chmod +x ./scripts/extract_firmware.sh
bash ./scripts/extract_firmware.sh "$(pwd)/${FW_DIR}/${MODEL}" "${MODEL}.zip"


# --- Run IMG Unpack cmd ---
chmod +x ./scripts/extract_ext4.sh
bash ./scripts/extract_ext4.sh "$(pwd)/${FW_DIR}/${MODEL}/${MODEL}"


# --- Run Debloat cmd ---
chmod +x ./QuantumROM/mods/debloater.sh
bash ./QuantumROM/mods/debloater.sh "$(pwd)/${FW_DIR}/${MODEL}/${MODEL}"


# --- Run Security Disabler cmd ---
chmod +x ./QuantumROM/mods/security_disabler.sh
chmod +x ./QuantumROM/mods/musti_disabler.sh
bash ./QuantumROM/mods/security_disabler.sh "$(pwd)/${FW_DIR}/${MODEL}/${MODEL}"
bash ./QuantumROM/mods/musti_disabler.sh "$(pwd)/${FW_DIR}/${MODEL}/${MODEL}"


# --- Run IMG Pack cmd ---
chmod +x ./scripts/pack_ext4.sh
bash ./scripts/pack_ext4.sh "$(pwd)/${FW_DIR}/${MODEL}/${MODEL}"


# --- Upload images in Google Drive ---
# python3 upload_files.py
