#!/bin/bash
# spanish version
# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/MagPiDownloader
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=0.1.0
# USAGE="Usage: bash magpi-issue-downloader_spanish.sh"

if [ ! -d "spanish_issues" ]; then
 mkdir spanish_issues
fi

i=1
issues=3

while [ "$i" -le "$issues" ]
do
	if [ "$i" -lt 10 ]; then
		wget https://www.raspberrypi.org/magpi-issues/MagPi_Mini_Spanish_0$i.pdf -P spanish_issues/
	else
		wget https://www.raspberrypi.org/magpi-issues/MagPi_Mini_Spanish_$i.pdf -P spanish_issues/
	fi
	i=$(( i+1 ))
done
