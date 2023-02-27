#!/bin/bash
# Purpose:      Restore Backup Docker files
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye) - Raspberry Pi 4
#==============================================================================
backup_folder=/home/pi/backup
# get latest backup file
backup_file=$(ls -t $backup_folder | head -1)
# extract backup file
echo -e "\033[0;32mExtracting backup file $backup_file...\033[0m"
sudo tar -xvpzf $backup_folder/$backup_file -C /
# start all containers using the up script in the backup
echo -e "\033[0;32mStarting all containers...\033[0m"
/home/docker/scripts/up.sh