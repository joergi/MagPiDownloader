#!/bin/bash
# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/MagPiDownloader
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=0.1.0
# USAGE="Usage: bash magpi-education-downloader.sh"

BASEDIR=$(dirname "$0")/..
OUTDIR=$BASEDIR/education_issues

if [ ! -d "$OUTDIR" ]; then
 mkdir "$OUTDIR"
fi

i=1
issues=2


while [ $i -le $issues ]
do
	if [ "$i" -lt 10 ]; then
		wget -N https://www.raspberrypi.org/magpi-issues/MagPi-EduEdition0$i.pdf -P "$OUTDIR"

	else
		wget -N https://www.raspberrypi.org/magpi-issues/MagPi-EduEdition$i.pdf -P "$OUTDIR"
	fi
	i=$(( i+1 ))
done
