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

file="$BASEDIR/sources-for-download/regular-issues.txt";
recentIssue=$(cat "$file");

# workaround for a known limitation in bash 3.x: http://lists.gnu.org/archive/html/bug-bash/2006-01/msg00018.html
# stackoverflow: https://stackoverflow.com/questions/32596123/why-source-command-doesnt-work-with-process-substitution-in-bash-3-2/32596626#32596626
# shellcheck disable=SC1091
source /dev/stdin <<<"$(curl -s https://raw.githubusercontent.com/joergi/downloader/0.3.0/linux_mac/downloader.sh)" "$downloadUrl" "$OUTDIR" "$recentIssue" "$@"


exit 0

