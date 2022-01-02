#!/bin/bash
# Purpose:      Update portainer enterprise edition
# Date:         02.01.2022 (DD.MM.YYYY)
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye)
#==============================================================================
docker stop portainer
docker rm portainer
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always --pull=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ee