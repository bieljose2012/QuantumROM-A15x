#!/bin/bash
set -e

#!/bin/bash
set -e

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <dir1> <dir2> ... <dirN>"
    exit 1
fi

for DIR in "$@"; do
    # Clean old dir
    rm -rf "$DIR"
    # Recreate dir
    mkdir -p "$DIR"
    # Show result
    echo "Directory prepared: $DIR"
done