#!/bin/bash
# Purpose:      Install Docker
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye)
#==============================================================================
echo -e "\033[0;32mInstall docker\033[0m"
# Update the apt package index:
sudo apt-get update
# Get the docker installer:
curl -fsSL https://get.docker.com -o get-docker.sh
# Run the installer:
sudo sh get-docker.sh
# Add the current user to the docker group:
sudo usermod -aG docker $USER
# Install docker-compose:
sudo apt-get install docker-compose-plugin
echo -e "\033[0;32mDone!\033[0m"
echo -e "\033[0;32mLogout and login again to apply changes\033[0m"