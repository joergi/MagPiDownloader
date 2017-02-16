# hebrew 

#!/bin/sh

# ------------------------------------------------------------------
# [Author] joergi77 - https://github.com/joergi77
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE 
# ------------------------------------------------------------------

VERSION=0.1.0
USAGE="Usage: sh magpi-issue-downloader_hebrew.sh"

if [ ! -d "hebrew_issues" ]; then
 mkdir hebrew_issues
fi

i=1
issues=3

while [ $i -le $issues ]
do
	if [ "$i" -lt 10 ]; then
		wget https://www.raspberrypi.org/magpi-issues/MagPi_Mini_Hebrew_0$i.pdf -P hebrew_issues/
	else
		wget https://www.raspberrypi.org/magpi-issues/MagPi_Mini_Hebrew_$i.pdf -P hebrew_issues/
	fi
	i=$(( i+1 ))
done
