#!/bin/bash
set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: bash $0 Device_Model"
    exit 1
fi

MODEL=$1

# Product
# Deleting frp line from $MODEL product build.prop.
sed -i "\~ro.frp.pst=/dev/block/bootdevice/by-name/frp~d" ../../fw_download/$MODEL/product/etc/build.prop

# Vendor
# Deleting $MODEL stock recovery.
rm -f "../../fw_download/$MODEL/vendor/recovery-from-boot.p"

# Runnig multidisabeler.
bash ./musti_disabler.sh $MODEL
