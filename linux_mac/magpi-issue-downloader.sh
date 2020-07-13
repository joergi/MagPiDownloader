#!/bin/bash
# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/MagPiDownloader
#          use now the generic common downloader (https://github.com/joergi/downloader/)
#
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=0.2.0
# USAGE="Usage: bash magpi-issue-downloader.sh [-f firstissue] [-l lastissue]"

BASEDIR=$(dirname "$0")/..
OUTDIR=$BASEDIR/issues

if [ ! -d "$OUTDIR" ]; then
 mkdir "$OUTDIR"
fi

downloadUrl="https://magpi.raspberrypi.org/issues/%02d/pdf"
file="$BASEDIR/issues.txt";
recentIssue=$(cat "$file");

# shellcheck disable=SC1090
source <(curl -s https://raw.githubusercontent.com/joergi/downloader/master/linux_mac/downloader.sh) "$downloadUrl" "$recentIssue" "$@"

exit 0

