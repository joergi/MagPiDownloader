#!/bin/bash
# ------------------------------------------------------------------
# [Author] joergi77 - https://github.com/joergi77
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE 
# ------------------------------------------------------------------

VERSION=0.1.0
USAGE="Usage: sh magpi-education-downloader.sh"


if [ ! -d "education_issues" ]; then
 mkdir education_issues
fi


i=1
issues=2


while [ $i -le $issues ]
do
	if [ "$i" -lt 10 ]; then
		wget https://www.raspberrypi.org/magpi-issues/MagPi-EduEdition0$i.pdf -P education_issues/
		
	else
		wget https://www.raspberrypi.org/magpi-issues/MagPi-EduEdition$i.pdf -P education_issues/
	fi
	i=$(( i+1 ))
done
