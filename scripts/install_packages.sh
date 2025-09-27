#!/bin/bash
set -e

# Linux setup:
apt update -y && apt upgrade -y
apt install -y p7zip-full lz4 android-sdk-libsparse-utils wget python3 python3-pip

# Installing Python Packages:
pip3 install liblp google-api-python-client google-auth-httplib2 google-auth-oauthlib tgcrypto pyrogram
pip3 install git+https://github.com/martinetd/samloader.git
