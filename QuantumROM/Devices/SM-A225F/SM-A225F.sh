#!/bin/bash

MODEL=SM-A225F
CSC=BKD
IMEI=350167020473859

# Download stock firmware.
sudo bash make_rom.sh $MODEL $CSC $IMEI
