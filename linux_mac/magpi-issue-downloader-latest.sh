#!/bin/bash
set -o errexit
#set -o pipefail
set -o nounset
IFS=$'\n\t'

# ------------------------------------------------------------------
# [Author] Kenichi Nagai https://github.com/keni-n/
#          downloader for all MagPi latest issues
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=1.0
# USAGE="Usage: bash magpi-issue-downloader-latest.sh"

MAGPI_URL="https://magpi.raspberrypi.com"
BASEDIR=$(dirname "$0")/..

#printf -v page_url "$MAGPI_URL/issues"
page_url=$(printf '%s\n' "$MAGPI_URL/issues")

latest_issues=$(curl -sf "$page_url" | grep "Get PDF" | head -n 1 | sed 's/^.*issues\///' | sed 's/\/pdf.*$//')
echo "Latest Issues is " "$latest_issues"

file="$BASEDIR/sources-for-download/regular-issues.txt";

# shellcheck disable=SC2046
bash $(dirname "$0")/magpi-issue-downloader.sh -f "$latest_issues" -l "$latest_issues"

# check filesize of downloaded file
# if it wasn't working its 0
filename=MagPi_"$latest_issues".pdf

# shellcheck disable=SC2002
filesize=$(cat ../issues/"$filename" | wc -c)

if [[ $filesize -gt 0 ]] ; then
  echo "$latest_issues" >"$file"
fi

exit 0
