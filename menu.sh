#!/bin/bash
# Purpose:      Menu for all scripts in the reposetory
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye)
#==============================================================================
repository="https://raw.githubusercontent.com/MrDKGE/Useful-Scripts/main/"

##
# Portainer functions
##
function portainer_community_install() {
  sh -c "$(curl -fsSL ${repository}Portainer/community-portainer-install.sh)"
}

function portainer_community_update() {
  sh -c "$(curl -fsSL ${repository}Portainer/community-portainer-update.sh)"
}

function portainer_community_remove() {
  sh -c "$(curl -fsSL ${repository}Portainer/community-portainer-remove.sh)"
}

function portainer_enterprise_install() {
  sh -c "$(curl -fsSL ${repository}Portainer/enterprise-portainer-install.sh)"
}

function portainer_enterprise_update() {
  sh -c "$(curl -fsSL ${repository}Portainer/enterprise-portainer-update.sh)"
}

function portainer_enterprise_remove() {
  sh -c "$(curl -fsSL ${repository}Portainer/enterprise-portainer-remove.sh)"
}

##
# Btop++ functions
##
function btop_install() {
  sh -c "$(curl -fsSL ${repository}btop/install.sh)"
}

function btop_remove() {
  sh -c "$(curl -fsSL ${repository}btop/uninstall.sh)"
}

##
# Docker
##
function docker_install() {
  sh -c "$(curl -fsSL ${repository}docker/install.sh)"
}
function docker_install_compose() {
  sh -c "$(curl -fsSL ${repository}docker/install-with-comoser.sh)"
}
function docker_clean() {
  sh -c "$(curl -fsSL ${repository}docker/clean.sh)"
}

##
# Linux
##
function linux_update() {
  sh -c "$(curl -fsSL ${repository}linux/update.sh)"
}

##
# Zsh
##
function zsh_install() {
  sh -c "$(curl -fsSL ${repository}zsh/install.sh)"
}

function zsh_remove() {
  sh -c "$(curl -fsSL ${repository}zsh/uninstall.sh)"
}

##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen() {
  echo -ne "$green""$1""$clear"
}
ColorBlue() {
  echo -ne "$blue""$1""$clear"
}

menu() {
  echo -ne "
My First Menu
$(ColorGreen '1)') Portainer
$(ColorGreen '2)') Btop++
$(ColorGreen '3)') Docker
$(ColorGreen '4)') General
$(ColorGreen '5)') Zsh
$(ColorGreen '0)') Exit
    $(ColorBlue 'Choose an option:') "
  read -r a
  case $a in
  1)
    portainer_menu
    portainer_menu
    ;;
  2)
    btop_menu
    menu
    ;;
  3)
    docker_menu
    menu
    ;;
  4)
    linux_menu
    menu
    ;;
  5)
    zsh_menu
    menu
    ;;
  0) exit 0 ;;
  *)
    echo -e "$red""Wrong option.""$clear"
    WrongCommand
    ;;
  esac
}

portainer_menu() {
  echo -ne "
Portainer Menu
$(ColorGreen '1)') Community Edition
$(ColorGreen '2)') Enterprise Edition
$(ColorGreen '0)') Main Menu
    $(ColorBlue 'Choose an option:') "
  read -r a
  case $a in
  1)
    portainer_menu_community
    portainer_menu_community
    ;;
  2)
    portainer_menu_enterprise
    portainer_menu_enterprise
    ;;
  0) menu ;;
  *)
    echo -e "$red""Wrong option.""$clear"
    WrongCommand
    ;;
  esac
}
portainer_menu_community() {
  echo -ne "
Portainer Menu
$(ColorGreen '1)') Install Portainer
$(ColorGreen '2)') Update Portainer
$(ColorGreen '3)') Remove Portainer
$(ColorGreen '0)') Main Menu
    $(ColorBlue 'Choose an option:') "
  read -r a
  case $a in
  1)
    portainer_community_install
    portainer_menu_community
    ;;
  2)
    portainer_community_update
    portainer_menu_community
    ;;
  3)
    portainer_community_remove
    portainer_menu_community
    ;;
  0) menu ;;
  *)
    echo -e "$red""Wrong option.""$clear"
    WrongCommand
    ;;
  esac
}
portainer_menu_enterprise() {
  echo -ne "
Portainer Menu
$(ColorGreen '1)') Install Portainer
$(ColorGreen '2)') Update Portainer
$(ColorGreen '3)') Remove Portainer
$(ColorGreen '0)') Main Menu
    $(ColorBlue 'Choose an option:') "
  read -r a
  case $a in
  1)
    portainer_enterprise_install
    portainer_menu_enterprise
    ;;
  2)
    portainer_enterprise_update
    portainer_menu_enterprise
    ;;
  3)
    portainer_enterprise_remove
    portainer_menu_enterprise
    ;;
  0) menu ;;
  *)
    echo -e "$red""Wrong option.""$clear"
    WrongCommand
    ;;
  esac
}

btop_menu() {
  echo -ne "
Btop++ Menu
$(ColorGreen '1)') Install Btop++
$(ColorGreen '2)') Uninstall Btop++
$(ColorGreen '0)') Main Menu
    $(ColorBlue 'Choose an option:') "
  read -r a
  case $a in
  1)
    btop_install
    btop_menu
    ;;
  2)
    btop_remove
    btop_menu
    ;;
  0) menu ;;
  *)
    echo -e "$red""Wrong option.""$clear"
    WrongCommand
    ;;
  esac
}
docker_menu() {
  echo -ne "
Docker Menu
$(ColorGreen '1)') Install Docker
$(ColorGreen '2)') Install Docker with Compose
$(ColorGreen '3)') Clean Docker
$(ColorGreen '0)') Main Menu
# Call the menu function
    $(ColorBlue 'Choose an option:') "
  read -r a
  case $a in
  1)
    docker_install
    docker_menu
    ;;
  2)
    docker_install_compose
    docker_menu
    ;;
  3)
    docker_clean
    docker_menu
    ;;
  0) menu ;;
  *)
    echo -e "$red""Wrong option.""$clear"
    WrongCommand
    ;;
  esac
}
linux_menu() {
  echo -ne "
Linux Menu
$(ColorGreen '1)') Update System
$(ColorGreen '0)') Main Menu
# Call the menu function
    $(ColorBlue 'Choose an option:') "
  read -r a
  case $a in
  1)
    linux_update
    linux_menu
    ;;
  0) menu ;;
  *)
    echo -e "$red""Wrong option.""$clear"
    WrongCommand
    ;;
  esac
}
zsh_menu() {
  echo -ne "
Zsh Menu
$(ColorGreen '1)') Install Zsh
$(ColorGreen '2)') Uninstall Zsh
$(ColorGreen '0)') Main Menu
# Call the menu function
    $(ColorBlue 'Choose an option:') "
  read -r a
  case $a in
  1)
    zsh_install
    zsh_menu
    ;;
  2)
    zsh_remove
    zsh_menu
    ;;
  0) menu ;;
  *)
    echo -e "$red""Wrong option.""$clear"
    WrongCommand
    ;;
  esac
}

# check if curl is installed
if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  echo 'Please install curl using the command: sudo apt-get install curl' >&2
  exit 1
fi
menu
