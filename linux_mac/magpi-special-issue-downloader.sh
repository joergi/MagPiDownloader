#!/bin/bash
# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/MagPiDownloader
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=0.1.0
# USAGE="Usage: sh magpi-special-issue-downloader.sh"


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

# Minecraft Essentials - Hacking and Making in Minecraft - https://www.raspberrypi.org/magpi/issues/essentials-minecraft-v1/
wget https://raspberrypi.org/magpi-issues/Essentials_Minecraft_v1.pdf -P special_issues/

# GPIO Zero Essentials - Simple Electronics with GPIO Zero
wget https://raspberrypi.org/magpi-issues/Essentials_GPIOZero_v1.pdf -P special_issues/

# C Essentials - Learn to code with C - https://www.raspberrypi.org/magpi/issues/essentials-c-v1/
wget https://www.raspberrypi.org/magpi-issues/Essentials_C_v1.pdf -P special_issues/

# Camera Essentials - The Camera Module Guide https://www.raspberrypi.org/magpi/issues/essentials_camera_v1/
wget https://www.raspberrypi.org/magpi-issues/Essentials_Camera_v1.pdf -P special_issues/

# AIY VOICE ESSENTIALS - https://www.raspberrypi.org/magpi/issues/essentials-aiy-v1/
wget https://www.raspberrypi.org/magpi-issues/Essentials_AIY_Projects_Voice_v1.pdf -P special_issues/
