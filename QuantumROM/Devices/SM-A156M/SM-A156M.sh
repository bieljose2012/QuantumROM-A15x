#!/bin/bash

MODEL=SM-A156M
CSC=ZTO
IMEI=356722912254488

# Download stock firmware.
sudo bash make_rom.sh $MODEL $CSC $IMEI
