#!/bin/bash
# Purpose:      Install portainer
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye)
#==============================================================================
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce