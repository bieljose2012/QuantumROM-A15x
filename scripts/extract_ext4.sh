#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <img_directory>"
    exit 1
fi

img_directory="$1"

for imgfile in ./$img_directory/*.img; do
    [ -e "$imgfile" ] || continue
    python3 ./bin/py_scripts/imgextractor.py "$imgfile" "$img_directory"
    # rm -rf ./$img_directory/*.img
done