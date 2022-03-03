#!/bin/bash
# Purpose:      Uninstall zsh and oh-my-zsh
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye)
#==============================================================================
# Uninstall zsh
sudo apt --purge remove zsh

# Set default shell to bash
chsh -s $(which bash)
# Uninstall oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/uninstall.sh)"
