#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Usage: bash $0 MODEL CSC IMEI DOWNLOAD_FOLDER"
    exit 1
fi

MODEL=$1
CSC=$2
IMEI=$3

# Download stock firmware.
sudo bash scripts/download_firmware.sh $MODEL $CSC $IMEI $MODEL
