#!/bin/bash
set -e

# Get script's directory.
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Directories.
FW_DIR="$BASE_DIR/fw_download"
BIN_DIR="$BASE_DIR/bin"
WORK_DIR="$BASE_DIR/work"
OUT_DIR="$BASE_DIR/out"

# Clean old dirs
rm -rf "$FW_DIR" "$WORK_DIR" "$OUT_DIR"

# Recreate directories
mkdir -p "$FW_DIR" "$WORK_DIR" "$OUT_DIR"

# Exporting directories.
export $FW_DIR
export $BIN_DIR
export $WORK_DIR
export $OUT_DIR

# Show directories
echo "Firmware Download Directory: $FW_DIR"
echo "Binary Directory: $BIN_DIR"
echo "Work Directory: $WORK_DIR"
echo "Out Directory: $OUT_DIR"
