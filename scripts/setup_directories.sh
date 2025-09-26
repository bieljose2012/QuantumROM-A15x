#!/bin/bash
set -e

# Directories
FW_DIR="fw_download"
BIN_DIR="bin"
WORK_DIR="work"
OUT_DIR="out"

# Clean old dirs
rm -rf "$FW_DIR" "$WORK_DIR" "$OUT_DIR"

# Recreate directories
mkdir -p "$FW_DIR" "$WORK_DIR" "$OUT_DIR"

# Show directories
echo "Firmware Download Directory: $FW_DIR"
echo "Binary Directory: $BIN_DIR"
echo "Work Directory: $WORK_DIR"
echo "Out Directory: $OUT_DIR"
