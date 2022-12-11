#!/bin/bash
# Purpose:      Backup Docker files
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye) - Raspberry Pi 4
# Cron:         0 0 */2 * * /home/pi/scripts/linux/backup.sh >/dev/null 2>&1
#==============================================================================
timestamp=$(date +%Y-%m-%d)

echo -e echo -e "\033[0;32mChecking if backup folder exists\033[0m"
if [ ! -d /home/pi/backup ]; then
    echo -e "\033[0;32mCreating backup folder\033[0m"
    mkdir /home/pi/backup
fi
echo -e "\033[0;32mBacking up Docker files...\033[0m"
sudo tar -cvpzf /home/pi/backup/docker-$timestamp.tar.gz /home/docker

# send backup to remote server using rsync
echo -e "\033[0;32mSending backup to remote server...\033[0m"
# server is using rsync daemon on port 873
rsync -avz --password-file=/home/pi/scripts/linux/rsync_pass /home/pi/backup/docker-$timestamp.tar.gz  rsync://RPI@192.168.1.5:873/RPI_Backup

# remove backup from local server
# echo -e "\033[0;32mRemoving backup from local server...\033[0m"
# rm /home/pi/backup/docker-$timestamp.tar.gz

# remove backups older than 30 days
echo -e "\033[0;32mRemoving backups older than 30 days...\033[0m"
find /home/pi/backup/*.tar.gz -mtime +30 -exec rm {} \;
