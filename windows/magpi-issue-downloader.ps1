#!/bin/bash
# ------------------------------------------------------------------
# [Author] rubemlrm - https://github.com/joergi/MagPiDownloader
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=0.1.2
# USAGE="Usage: sh magpi-issue-downloader.sh [-f firstissue] [-l lastissue]"


Param(
    [string]$f,
    [string]$l
)

# control variables
$baseDir = (Split-Path -Path $PSScriptRoot -Parent)
$baseUrl = "https://magpi.raspberrypi.org/issues/"
$fFlag = ""
$rFlag = ""
$lFlag = ""

# Check if directory dont exist and try create
if ( -Not (Test-Path -Path "$baseDir\issues" ) ) {
    New-Item -ItemType directory -Path "$baseDir\issues"
}


if ($f) {
    $fFlag = "-f $f"
}
if ($r) {
    $rFlag = "-r $r"
} else {
    $rFlag = Get-Content "$baseDir\sources-for-download\regular-issues.txt" -First 1
}

if ($l) {
    $lFlag = "-l $l"
}

Invoke-WebRequest "https://raw.githubusercontent.com/Rubemlrm/downloader/main/windows/generic-downloader.ps1" -OutFile "$baseDir\downloader.ps1"
powershell.exe $baseDir\downloader.ps1 -url $baseUrl -outDir "$baseDir\issues\" $fFlag $rFlag $lFlag
Remove-Item "$baseDir\downloader.ps1"
