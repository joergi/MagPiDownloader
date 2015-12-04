#!/bin/sh
# ------------------------------------------------------------------
# [Author] joergi77 - https://github.com/joergi77
#          downloader for all MagPi issues
# 				 they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#					 or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
# 				 this script is under GNU GENERAL PUBLIC LICENSE 
# ------------------------------------------------------------------

VERSION=0.1.0
USAGE="Usage: sh magpidownloader.sh"


if [ ! -d "issues" ]; then
 mkdir issues
fi


i=1
issues=40


while [ $i -le $issues ]
do
	if [ "$i" -lt 10 ]; then
		wget https://www.raspberrypi.org/magpi-issues/MagPi0$i.pdf -P issues/
		
	else
		wget https://www.raspberrypi.org/magpi-issues/MagPi$i.pdf -P issues/
	fi
	i=$(( i+1 ))
done


