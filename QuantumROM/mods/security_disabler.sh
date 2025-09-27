#!/bin/bash
set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: bash $0 <ROM_DIR>"
    exit 1
fi

ROM_DIR=$1

# Product
# Deleting frp line from $MODEL product build.prop.
sed -i "\~ro.frp.pst=/dev/block/bootdevice/by-name/frp~d" $ROM_DIR/product/etc/build.prop

# Vendor
# Deleting $MODEL stock recovery.
rm -f "$ROM_DIR/vendor/recovery-from-boot.p"