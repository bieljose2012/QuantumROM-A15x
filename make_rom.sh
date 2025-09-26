#!/bin/bash
set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: bash $0 Device_Model"
    exit 1
fi

MODEL=$1

# Run Debloat cmd.
chmod +x ./QuantumROM/mods/debloater.sh
bash ./QuantumROM/mods/debloater.sh

# Run security disabler cmd.
chmod +x ./QuantumROM/mods/security_disabler.sh
bash ./QuantumROM/mods/security_disabler.sh

# Run img pack cmd.
chmod +x ./scripts/pack_ext4.sh
bash ./scripts/pack_ext4.sh
