#!/bin/bash
# Purpose:      Install Docker Compose
# Date:         24.11.2021 (DD.MM.YYYY)
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye)
#==============================================================================
echo -e "\033[0;32mInstalling Docker Compose...\033[0m"
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version