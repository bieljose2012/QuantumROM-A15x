#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Usage: bash $0 MODEL CSC IMEI DOWNLOAD_FOLDER"
    exit 1
fi

MODEL=SM-A225F
CSC=BKD
IMEI=350167020473859

# Download stock firmware.
sudo bash scripts/download_firmware.sh $MODEL $CSC $IMEI $MODEL
