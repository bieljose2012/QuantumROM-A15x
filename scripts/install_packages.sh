#!/bin/bash

# if [[ "$OSTYPE" == "linux-android"* ]] || [[ "$(uname -o)" == "Android" ]]; then
#    echo "Detected Termux (Android)"
#    # Termux setup:
#    pkg update -y && pkg upgrade -y
#    pkg install -y tsu git mount-utils android-tools blk-utils p7zip lz4 wget python3

# elif [[ "$(uname -s)" == "Linux" ]]; then
#    echo "Detected Linux"
#    # Linux setup:
#    apt update -y && apt upgrade -y
#    apt install -y p7zip-full lz4 android-sdk-libsparse-utils wget python3 python3-pip
# else
#    echo "Unsupported OS"
#    exit 1
# fi

# Linux setup:
apt update -y && apt upgrade -y
apt install -y p7zip-full lz4 android-sdk-libsparse-utils wget python3 python3-pip

# Installing Python Packages:
pip3 install liblp
pip3 install git+https://github.com/martinetd/samloader.git
