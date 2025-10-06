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
1:  **For download and rom mod:**
```bash
sudo chmod +x mod_rom_1.sh
```
```bash
sudo bash mod_rom_1.sh DEVICE_MODEL CSC IMEI
```

2:  **For previous downloaded rom mod:**
Run setup_directories.sh for make directories. Then copybthe firmware zip in fw_download folder. DEVICE_MODEL is firmware zip name. After copy Rename the firmware zip with actual device model name like SM-A225F.zip. On cmd DEVICE_MODEL is same name of firmware name without .zip extension.

```bash
sudo chmod +x ./scripts/setup_directories.sh &&
sudo bash ./scripts/setup_directories.sh
```

```bash
sudo chmod +x mod_rom_2.sh
```
```bash
sudo bash mod_rom_2.sh DEVICE_MODEL
```
