#!/bin/bash
# Purpose:      Install btop++
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye) (Raspberry Pi 3b+)
#==============================================================================
echo -e "\033[0;32mInstalling btop++\033[0m"
# cd to home directory
cd ~
# Download btop++
wget https://github.com/aristocratos/btop/releases/download/v1.2.4/btop-aarch64-linux-musl.tbz
# Create directory for btop++
mkdir btop
# Extract btop++ to home directory in btop directory
tar -xvf btop-aarch64-linux-musl.tbz -C btop
# Remove btop++ archive
rm btop-aarch64-linux-musl.tbz
# Go to btop++ directory
cd btop
# Install btop++
sudo make install
echo -e "\033[0;32mInstallation Complete\033[0m"
