
#!/bin/bash

MODEL=SM-S711B
CSC=INS
IMEI=355195302007124

# Download stock firmware.
sudo bash scripts/download_firmware.sh $MODEL $CSC $IMEI $MODEL
