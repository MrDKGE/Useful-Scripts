#!/bin/bash
# Purpose:      Search whole system for file containg certain text.
# Date:         10.11.2021
# Version:      1.0.0

find / -type f -exec grep -l "You have been blocked for too many failed login attempts or you do not have permission to access the system." {} \; >> /volume1/home/dkge/search.txt
echo -e "\033[0;32mSearch Complete\033[0m"
