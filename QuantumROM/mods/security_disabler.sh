#!/bin/bash
set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: bash $0 Device_Model"
    exit 1
fi

MODEL=$1

echo "Deleting $MODEL stock recovery."
rm -f "../../fw_download/$MODEL/vendor/recovery-from-boot.p"
