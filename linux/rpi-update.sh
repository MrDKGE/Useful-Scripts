#!/bin/bash
# Purpose:      Updating software and firmware on Raspberry Pi
# Warning:      This script should not be used in cron jobs, only for manual use.
# Version:      1.0.2
# Tested on:    Debian 11 (Bullseye) - Raspberry Pi 4
#==============================================================================
echo -e "\033[0;32mFetching list of available updates...\033[0m"
sudo apt update
echo -e "\033[0;32mUpgrading current packages...\033[0m"
sudo apt full-upgrade -y
echo -e "\033[0;32mRunning rpi-update\033[0m"
sudo rpi-update
echo -e "\033[0;32mRemoving orphaned packages/dependencies...\033[0m"
sudo apt autoremove -y
echo -e "\033[0;32mClearing sudo apt cache...\033[0m"
sudo apt autoclean && sudo apt clean
echo -e "\033[0;32mUpdate Complete\033[0m"
echo -e "\033[0;32mRebooting...\033[0m"
sudo reboot