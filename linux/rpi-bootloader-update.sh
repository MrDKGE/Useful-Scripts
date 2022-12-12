#!/bin/bash
# Purpose:      Update the Raspberry Pi bootloader
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye) - Raspberry Pi 4
#==============================================================================
echo -e "\033[0;32mThis script will update the Raspberry Pi bootloader and reboot the system.\033[0m"
read -p "Do you want to continue? [y/n] " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo -e "\033[0;32mContinuing...\033[0m"
else
    echo -e "\033[0;32mExiting...\033[0m"
    exit
fi
echo -e "\033[0;32mFetching list of available updates and upgrading current packages\033[0m"
sudo apt update && sudo apt full-upgrade -y
echo -e "\033[0;32mUpdating Raspberry Pi OS kernel and VideoCore firmware...\033[0m"
sudo rpi-update -y
echo -e "\033[0;32mRemoving orphaned packages/dependencies...\033[0m"
sudo apt autoremove -y
echo -e "\033[0;32mClearing sudo apt cache...\033[0m"
sudo apt autoclean && sudo apt clean
echo -e "\033[0;32mUpdating Raspberry Pi bootloader...\033[0m"
sudo rpi-eeprom-update -a
echo -e "\033[0;32mRebooting...\033[0m"
sudo reboot