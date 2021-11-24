#!/bin/bash
# Purpose:      Install Docker Compose
# Date:         24.11.2021 (DD.MM.YYYY)
# Version:      1.0.0
# Tested on:    Debian 11 (Bullseye)
#==============================================================================
echo -e "\033[0;32mInstalling Docker Compose...\033[0m"
EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php
echo -e "\033[0;32mDocker Compose installed.\033[0m"
exit $RESULT