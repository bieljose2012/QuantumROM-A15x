if [ "$#" -ne 1 ]; then
    echo "Usage: bash $0 Device_Model"
    exit 1
fi

MODEL=$1

# Debloat $MODEL Product.
rm -rf "../../fw_download/$MODEL/product/app/DuoStub"
rm -rf "../../fw_download/$MODEL/product/app/GoogleCalendarSyncAdapter"
rm -rf "../../fw_download/$MODEL/product/app/SpeechServicesByGoogle"
rm -rf "../../fw_download/$MODEL/product/priv-app/AndroidAutoStub"
rm -rf "../../fw_download/$MODEL/product/priv-app/AndroidSystemIntelligence"
rm -rf "../../fw_download/$MODEL/product/priv-app/GoogleRestore"
rm -rf "../../fw_download/$MODEL/product/priv-app/Messages"
rm -rf "../../fw_download/$MODEL/product/priv-app/SearchSelector"
