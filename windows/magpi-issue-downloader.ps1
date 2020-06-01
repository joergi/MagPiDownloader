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
$i = 1
$baseDir = (Split-Path -Path $PSScriptRoot -Parent)
$issues = Get-Content "$baseDir\sources-for-download\regular-issues.txt" -First 1
$baseUrl = "https://magpi.raspberrypi.org/issues/"
$web = New-Object system.net.webclient
$errorCount = 0

# Check if directory dont exist and try create
if ( -Not (Test-Path -Path "$baseDir\issues" ) ) {
    New-Item -ItemType directory -Path "$baseDir\issues"
}


if ($f) {
    $i = [int]$f
}

if ($l) {
    $issues = [int]$l
}

do {
    #start scrapping directory and download files

    $tempCounter = if ($i -le 9) { "{0:00}" -f $i }  Else { $i }

    $fileReponse = ((Invoke-WebRequest -UseBasicParsing "$baseUrl$tempCounter/pdf").Links | Where-Object { $_.href -like "http*" } | Where class -eq c-link)
    if ($fileReponse) {
        try {
            $web.DownloadFile($fileReponse.href, "$baseDir\issues\" + $fileReponse.download)
            Write-Host "Downloaded from " + $fileReponse.href
        }
        Catch {
            Write-Host $_.Exception | format-list -force
            Write-Host "Ocorred an error trying download " + $fileReponse.download
            $errorCount++
        }
    }
    $i++
} While ($i -le $issues)

if ($errorCount -gt 0) {
    exit 1
}
