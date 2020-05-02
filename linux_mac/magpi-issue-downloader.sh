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

BASEDIR=`dirname $0`/..
OUTDIR=$BASEDIR/issues

if [ ! -d "$OUTDIR" ]; then
 mkdir $OUTDIR
fi

i=1
file="$BASEDIR/issues.txt";
issues=$(cat "$file");

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
		printf -v page_url "https://magpi.raspberrypi.org/issues/%02d/pdf" $i
		pdf_url=`curl -sf $page_url | grep c-link | sed 's/^.*href=\"//' | sed 's/\?.*$//'`
		wget -N $pdf_url -P $OUTDIR
		i=$(( i+1 ))
	done

exit 0
