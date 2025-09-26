#!/bin/bash
set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: bash $0 ROM_DIR"
    exit 1
fi

ROM_DIR=$1

# Debloat $ROM_DIR Product.
rm -rf "$ROM_DIR/product/app/DuoStub"
rm -rf "$ROM_DIR/product/app/GoogleCalendarSyncAdapter"
rm -rf "$ROM_DIR/product/app/SpeechServicesByGoogle"
rm -rf "$ROM_DIR/product/priv-app/AndroidAutoStub"
rm -rf "$ROM_DIR/product/priv-app/AndroidSystemIntelligence"
rm -rf "$ROM_DIR/product/priv-app/GoogleRestore"
rm -rf "$ROM_DIR/product/priv-app/Messages"
rm -rf "$ROM_DIR/product/priv-app/SearchSelector"
