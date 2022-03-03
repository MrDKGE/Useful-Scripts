#!/bin/bash
# Purpose:      Install zsh with the default kali configuration
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye)
#==============================================================================
# Update package list
apt update
# Check if curl is installed
if ! [ -x "$(command -v curl)" ]; then
    echo -e "\033[0;31mError: curl is not installed.\033[0m"
    # Install curl
    echo -e "\033[0;32mInstalling curl...\033[0m"
    sudo apt install curl -y
fi
# Install zsh
sudo apt install -y zsh
# Set default shell to zsh
chsh -s $(which zsh)
# download the kali configuration and replace the default one
curl -fsSL https://gitlab.com/kalilinux/packages/kali-defaults/-/raw/kali/master/etc/skel/.zshrc > ~/.zshrc
