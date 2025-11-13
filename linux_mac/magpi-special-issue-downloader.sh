#!/bin/bash
set -o errexit
#set -o pipefail ## it's failing for line 82 + 86 in downloader
set -o nounset
IFS=$'\n\t'

# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/MagPiDownloader
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=0.1.0
# USAGE="Usage: bash magpi-special-issue-downloader.sh"

BASEDIR=$(dirname "$0")/..
OUTDIR=$BASEDIR/special_issues

if [ ! -d "$OUTDIR" ]; then
 mkdir "$OUTDIR"
fi


file=$BASEDIR"/sources-for-download/special-issues.txt"
while IFS= read -r line
do
	bash <(curl https://raw.githubusercontent.com/joergi/downloader/0.5.1/linux_mac/downloader.sh) "$line" "$OUTDIR"
done < "$file"

exit 0
