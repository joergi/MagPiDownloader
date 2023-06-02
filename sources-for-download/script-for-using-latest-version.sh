#!/bin/bash
set -o errexit
#set -o pipefail
set -o nounset
IFS=$'\n\t'

# ------------------------------------------------------------------
# based on the script Kenichi Nagai https://github.com/keni-n/
# https://github.com/joergi/MagPiDownloader/blob/main/linux_mac/magpi-issue-downloader-latest.sh
# ------------------------------------------------------------------

# VERSION=0.1
# you don't need to run this script
# this is running automatically on Github each date to update the latest issues

MAGPI_URL="https://magpi.raspberrypi.com"
BASEDIR=$(dirname "$0")/..

#printf -v page_url "$MAGPI_URL/issues"
page_url=$(printf '%s\n' "$MAGPI_URL/issues")

latest_issue=$(curl -sf "$page_url" | grep "Download PDF" | head -n 1 | sed 's/^.*issues\///' | sed 's/\/pdf.*$//')
echo "Latest Issue is " "$latest_issue"

file="$BASEDIR/sources-for-download/regular-issues.txt";
echo "$latest_issue" >"$file"
