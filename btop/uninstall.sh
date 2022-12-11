#!/bin/bash
# Purpose:      Uninstall btop++
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye) (Raspberry Pi 3b+)
#==============================================================================
echo -e "\033[0;32mUninstalling btop++...\033[0m"
# cd to home and go in btop++ directory
cd ~/btop
# Uninstall btop++
sudo make uninstall
# Go out of the folder
cd ~
# Remove btop++ directory
sudo rm -rf btop
echo -e "\033[0;32mUninstallation complete\033[0m"
