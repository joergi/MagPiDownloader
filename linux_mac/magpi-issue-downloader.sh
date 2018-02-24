#!/bin/bash
# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/MagPiDownloader
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=0.1.2
# USAGE="Usage: sh magpi-issue-downloader.sh [-f firstissue] [-l lastissue]"

if [ ! -d "issues" ]; then
 mkdir issues
fi

i=1
file="../issues.txt";
issues=$(cat "$file");

if [ -z $1 ]
then
	wget https://www.raspberrypi.org/magpi-issues/ \
	--recursive \
	--no-directories \
	--no-parent \
	--directory-prefix issues \
	--mirror \
	--accept-regex "/MagPi[0-9]+\.pdf" \
	--reject index.html \
	--execute robots=off

else

	while :
	do
		case "$1" in
		-f) shift; i="$1";;
		-l) shift; issues="$1";;
		--) shift; break;;
		-*) usage "bad argument $1";;
		*) break;;
		esac
		shift
	done

	while [ $i -le $issues ]
	do
		if [ "$i" -lt 10 ]; then
			wget https://www.raspberrypi.org/magpi-issues/MagPi0$i.pdf -P issues/

		else
			wget https://www.raspberrypi.org/magpi-issues/MagPi$i.pdf -P issues/
		fi
		i=$(( i+1 ))
	done

fi
