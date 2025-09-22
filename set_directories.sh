#!/bin/bash
set -e

# Get script's directory.
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Settings up directories.
export fw_dir="$BASE_DIR/fw_download"
export bin_dir="$BASE_DIR/bin"
export work_dir="$BASE_DIR/work"
export out_dir="$BASE_DIR/out"

# Show directories
echo "Firmware Download Dir: $fw_dir"
echo "Bin Dir:              $bin_dir"
echo "Work Dir:             $work_dir"
echo "Out Dir:              $out_dir"

# Clean old dirs
rm -rf "$firmware_download_dir" "$work_dir" "$out_dir"

# Recreate directories
mkdir -p "$firmware_download_dir" "$work_dir" "$out_dir"
