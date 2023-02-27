#!/bin/bash
# Purpose:      Clean up docker leftovers
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye)
#==============================================================================
echo -e "\033[0;32mRemoving unused images, volumes and networks\033[0m"
docker system prune -a --volumes -f
docker volume rm $(docker volume ls -f dangling=true -q)
docker rmi $(docker images --quiet --filter "dangling=true")
echo -e "\033[0;32mDone!\033[0m"