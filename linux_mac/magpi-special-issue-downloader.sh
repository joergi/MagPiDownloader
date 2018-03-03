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

BASEDIR=`dirname $0`/..
OUTDIR=$BASEDIR/special_issues

if [ ! -d "$OUTDIR" ]; then
 mkdir $OUTDIR
fi

# Essential Games v1
wget -N https://www.raspberrypi.org/magpi-issues/Essentials_Games_v1.pdf -P $OUTDIR

# Project Book - v1 https://www.raspberrypi.org/magpi/issues/projects-1/
wget -N https://raspberrypi.org/magpi-issues/Projects_Book_v1.pdf -P $OUTDIR

# Project Book - v2 https://www.raspberrypi.org/magpi/issues/projects-2/
wget -N https://www.raspberrypi.org/magpi-issues/Projects_Book_v2.pdf -P $OUTDIR

# Project Book - v3 https://www.raspberrypi.org/magpi/issues/projects-3/
wget -N https://www.raspberrypi.org/magpi-issues/Projects_Book_v3.pdf -P $OUTDIR

# Bash Essentials v1 - https://www.raspberrypi.org/magpi/issues/essentials-bash-vol1/
wget -N https://raspberrypi.org/magpi-issues/Essentials_Bash_v1.pdf -P $OUTDIR

# Essentials Sense Hat v1 - https://www.raspberrypi.org/magpi/issues/essentials-sense-hat-v1/
wget -N https://www.raspberrypi.org/magpi-issues/Essentials_SenseHAT_v1.pdf -P $OUTDIR

# Sonic Pi Essentials - Code Music with Sonic Pi - https://www.raspberrypi.org/magpi/issues/essentials-sonic-pi-v1/
wget -N https://raspberrypi.org/magpi-issues/Essentials_Sonic_Pi-v1.pdf -P $OUTDIR

# Scratch Essentials - Learn to code with scratch - https://www.raspberrypi.org/magpi/issues/essentials-scratch-v1/
wget -N https://www.raspberrypi.org/magpi-issues/Essentials_Scratch_v1.pdf -P $OUTDIR

# Minecraft Essentials - Hacking and Making in Minecraft - https://www.raspberrypi.org/magpi/issues/essentials-minecraft-v1/
wget -N https://raspberrypi.org/magpi-issues/Essentials_Minecraft_v1.pdf -P $OUTDIR

# GPIO Zero Essentials - Simple Electronics with GPIO Zero
wget -N https://raspberrypi.org/magpi-issues/Essentials_GPIOZero_v1.pdf -P $OUTDIR

# C Essentials - Learn to code with C - https://www.raspberrypi.org/magpi/issues/essentials-c-v1/
wget -N https://www.raspberrypi.org/magpi-issues/Essentials_C_v1.pdf -P $OUTDIR

# Camera Essentials - The Camera Module Guide https://www.raspberrypi.org/magpi/issues/essentials_camera_v1/
wget -N https://www.raspberrypi.org/magpi-issues/Essentials_Camera_v1.pdf -P $OUTDIR

# AIY VOICE ESSENTIALS - https://www.raspberrypi.org/magpi/issues/essentials-aiy-v1/
wget -N https://www.raspberrypi.org/magpi-issues/Essentials_AIY_Projects_Voice_v1.pdf -P $OUTDIR

# THE OFFICIAL RASPBERRY PI BEGINNER’S BOOK (2018) - https://www.raspberrypi.org/magpi/issues/beginners-1/
wget -N https://www.raspberrypi.org/magpi-issues/Beginners_Book_v1.pdf -P $OUTDIR

# Raspberry Pi THE ANNUAL 2018
wget -N https://www.raspberrypi.org/magpi-issues/Annual2018.pdf -P $OUTDIR


