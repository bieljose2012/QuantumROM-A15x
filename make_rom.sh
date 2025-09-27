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
WORK_DIR="work"
OUT_DIR="out"


# --- Setup Directories ---
chmod +x ./scripts/setup_directories.sh
bash ./scripts/setup_directories.sh "FW_DIR" "WORK_DIR" "OUT_DIR"


# --- Start firmware download ---
chmod +x ./scripts/download_firmware.sh
bash ./scripts/download_firmware.sh "$MODEL" "$CSC" "$IMEI" "$FW_DIR" "$MODEL"


# --- Extract Firmware ---
chmod +x ./scripts/extract_firmware.sh
bash ./scripts/extract_firmware.sh "$(pwd)/${FW_DIR}/${MODEL}" "${MODEL}.zip"


# --- Run IMG Unpack cmd ---
chmod +x ./scripts/extract_ext4.sh
bash ./scripts/extract_ext4.sh "$(pwd)/${FW_DIR}/${MODEL}"


# --- Run Debloat cmd ---
chmod +x ./QuantumROM/mods/debloater.sh
bash ./QuantumROM/mods/debloater.sh "$(pwd)/${FW_DIR}/${MODEL}"


# --- Run Security Disabler cmd ---
chmod +x ./QuantumROM/mods/security_disabler.sh
chmod +x ./QuantumROM/mods/musti_disabler.sh
bash ./QuantumROM/mods/security_disabler.sh "$(pwd)/${FW_DIR}/${MODEL}"
bash ./QuantumROM/mods/musti_disabler.sh "$(pwd)/${FW_DIR}/${MODEL}"


# --- Run IMG Pack cmd ---
chmod +x ./scripts/pack_ext4.sh
bash ./scripts/pack_ext4.sh "$(pwd)/${FW_DIR}/${MODEL}"


# --- Upload images in Google Drive ---
# python3 upload_files.py
