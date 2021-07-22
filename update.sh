#!/bin/bash
# Purpose:      Updating software with custom messages.
# Date:         01.07.2021
# Version:      1.0.0

echo -e "\033[0;32mFetching list of available updates...\033[0m"
sudo apt update
echo -e "\033[0;32mUpgrading current packages...\033[0m"
sudo apt upgrade -y
echo -e "\033[0;32mRemoving orphaned packages/dependencies...\033[0m"
sudo apt autoremove -y
echo -e "\033[0;32mClearing sudo apt cache...\033[0m"
sudo apt autoclean && sudo apt clean
echo -e "\033[0;32mUpdate Complete\033[0m"
