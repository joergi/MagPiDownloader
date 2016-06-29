#!/bin/sh
# ------------------------------------------------------------------
# [Author] joergi77 - https://github.com/joergi77
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE 
# ------------------------------------------------------------------

VERSION=0.1.0
USAGE="Usage: sh magpi-special-issue-downloader.sh"


if [ ! -d "special_issues" ]; then
 mkdir special_issues
fi

# Essential Games v1
wget https://www.raspberrypi.org/magpi-issues/Essentials_Games_v1.pdf -P special_issues/

# Project Book - v1 https://www.raspberrypi.org/magpi/issues/projects-1/
wget https://raspberrypi.org/magpi-issues/Projects_Book_v1.pdf -P special_issues/

# Bash Essentials v1 - https://www.raspberrypi.org/magpi/issues/essentials-bash-vol1/
wget https://raspberrypi.org/magpi-issues/Essentials_Bash_v1.pdf -P special_issues/

# Essentials Sense Hat v1 - https://www.raspberrypi.org/magpi/issues/essentials-sense-hat-v1/
wget https://www.raspberrypi.org/magpi-issues/Essentials_SenseHAT_v1.pdf -P special_issues/

# Sonic Pi Essentials - Code Music with Sonic Pi - https://www.raspberrypi.org/magpi/issues/essentials-sonic-pi-v1/
wget https://raspberrypi.org/magpi-issues/Essentials_Sonic_Pi-v1.pdf -P special_issues/

# Scratch Essentials - Learn to code with scratch - https://www.raspberrypi.org/magpi/issues/essentials-scratch-v1/
wget https://www.raspberrypi.org/magpi-issues/Essentials_Scratch_v1.pdf -P special_issues/




