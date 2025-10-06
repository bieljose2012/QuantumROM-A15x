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
**For first time install required packages.**
```bash
sudo chmod +x ./scripts/install_packages.sh && sudo bash ./scripts/install_packages.sh
```

1:  **For download and rom mod:**
```bash
sudo chmod +x mod_rom_1.sh
```
```bash
sudo bash mod_rom_1.sh DEVICE_MODEL CSC IMEI
```

2:  **For previous downloaded rom mod:**
Run setup_directories.sh to create the directories. Then, copy the firmware ZIP file into the fw_download folder. DEVICE_MODEL refers to the firmware file name. After copying, rename the firmware ZIP to match the actual device model name, for example, SM-A225F.zip. In the command line, DEVICE_MODEL should be the firmware file name without the .zip extension.

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
