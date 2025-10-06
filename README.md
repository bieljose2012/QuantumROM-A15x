![QuantumROM Logo](QuantumROM/logo/QuantumROM.jpg)

# Tools Features:
**Direct Firmware Download:**
Seamlessly fetch the latest firmware directly from Samsung’s official servers.

**Image Unpack & Repack:**
 Efficiently extract and reassemble .img files with precision and ease.

**Security Removal:**
Tools to bypass or remove security restrictions for enhanced customization.

**Rom Debloat:**
Remove unwanted pre-installed apps and optimize device performance.

# Usage: #
**Linux Terminal:**
For personal linux terminal.

1.  **Directory Setup:**
```bash
sudo chmod +x ./scripts/setup_directories.sh && sudo bash ./scripts/setup_directories.sh```

#
2.  **Download Firmware:** [ No need if you have Firmware downloaded. If have already the firmware zip then put the firmware zip in fw_download folder ]
```bash
chmod +x ./scripts/download_firmware.sh
bash ./scripts/download_firmware.sh "$MODEL" "$CSC" "$IMEI" "$FW_DIR"

