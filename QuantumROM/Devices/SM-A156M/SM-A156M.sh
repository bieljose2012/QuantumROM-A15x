#!/bin/bash

MODEL=SM-A156M
CSC=ZTO
IMEI=354173248071257

# Download stock firmware.
sudo bash make_rom.sh $MODEL $CSC $IMEI
