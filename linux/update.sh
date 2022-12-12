#!/bin/bash
# Purpose:      Updating software with custom messages.
# Version:      1.0.2
# Tested on:    Debian 11 (Bullseye)
#==============================================================================
echo -e "\033[0;32mFetching list of available updates and upgrading current packages\033[0m"
sudo apt update && sudo apt full-upgrade -y
echo -e "\033[0;32mRemoving orphaned packages/dependencies...\033[0m"
sudo apt autoremove -y
echo -e "\033[0;32mClearing sudo apt cache...\033[0m"
sudo apt autoclean && sudo apt clean
echo -e "\033[0;32mUpdate Complete\033[0m"
if [ -f /var/run/reboot-required ]
then
    echo -e "\033[0;32mA reboot is required after the update.\033[0m"
    read -p "Do you want to reboot now? [y/n] " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo -e "\033[0;32mRebooting...\033[0m"
        sudo reboot
    else
        echo -e "\033[0;32mExiting...\033[0m"
        exit
    fi
else
    echo -e "\033[0;32mNo reboot is required after the update.\033[0m"
    exit
fi