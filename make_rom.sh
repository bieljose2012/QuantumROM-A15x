#!/bin/bash
set -e

if [ "$#" -ne 3 ]; then
    echo "Usage: bash $0 MODEL CSC IMEI"
    exit 1
fi

MODEL=$1
CSC=$2
IMEI=$3

# Run Debloat cmd.
chmod +x ./QuantumROM/mods/debloater.sh
bash ./QuantumROM/mods/debloater.sh

# Run security disabler cmd.
chmod +x ./QuantumROM/mods/security_disabler.sh
bash ./QuantumROM/mods/security_disabler.sh

# Run img pack cmd.
chmod +x ./scripts/pack_ext4.sh
bash ./scripts/pack_ext4.sh
