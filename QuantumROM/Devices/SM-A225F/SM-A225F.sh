#!/bin/bash

MODEL=SM-A225F
CSC=BKD
IMEI=350167020473859

# Download stock firmware.
sudo bash scripts/download_firmware.sh $MODEL $CSC $IMEI $MODEL
