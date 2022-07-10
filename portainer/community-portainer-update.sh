#!/bin/bash
# Purpose:      Update portainer
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye)
#==============================================================================
docker pull portainer/portainer-ce
docker stop portainer
docker rm portainer
docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce