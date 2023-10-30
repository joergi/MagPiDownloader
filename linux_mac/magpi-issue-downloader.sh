#!/bin/bash
set -o errexit
#set -o pipefail ## it's failing for line 82 + 86 in downloader
set -o nounset
IFS=$'\n\t'

while getopts f:l:t: flag
do
    case "${flag}" in
		t) type=${OPTARG};;
		*) echo "Invalid option: -${OPTARG}";;
    esac
done
if [[ -z ${type+x} ]]; then
	type="issue"
fi

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

if [[ $type = "issue" ]]; then
	echo "Downloading issues"


	downloadUrl="https://magpi.raspberrypi.com/issues/%02d/pdf/download"

	file="$BASEDIR/sources-for-download/regular-issues.txt";

	if [ "${IS_DOCKER:-false}" == "true" ]; then
		remote_url="https://raw.githubusercontent.com/joergi/MagPiDownloader/main/sources-for-download/regular-issues.txt"
		recentIssue=$(curl -s "$remote_url")
	else
		recentIssue=$(cat "$file")
	fi
	curl -s https://raw.githubusercontent.com/joergi/downloader/0.4.6/linux_mac/downloader.sh | bash /dev/stdin "$downloadUrl" "$OUTDIR" "$recentIssue" MagPi_ "${@}"
elif [[ $type = "special" ]]; then
	echo "Downloading special issues"

	file=$BASEDIR"/sources-for-download/special-issues.txt"
	while IFS= read -r line
	do
		curl -s https://raw.githubusercontent.com/joergi/downloader/0.4.6/linux_mac/downloader.sh | bash /dev/stdin "$line" "$OUTDIR"
	done < "$file"
fi

exit 0

