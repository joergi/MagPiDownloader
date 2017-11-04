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
$i=1
$issues=63
$baseUrl="https://www.raspberrypi.org/magpi-issues"
$web = New-Object system.net.webclient
$errorCount = 0
# Check if directory dont exist and try create
if( -Not (Test-Path -Path "issues" ) )
{
    New-Item -ItemType directory -Path "issues"
}

#check last command executation
if(-Not $f) {
    #start scrapping directory and download files
    $l = (Invoke-WebRequest -Uri $baseUrl -usebasicparsing).Links

    ($web.downloadstring($baseUrl) -split "<a\s+") | %{
        [void]($_ -match "^href=[`'`"]([^`'`">\s]*)");
        if ($matches.Length -gt 0) {
        $file = $matches[1]
            if( $file -match 'MagPi[0-9]+\.pdf') {
                try
                {
                    Write-Host $env:appdata
                    $fileUrl = $baseUrl + "/" + $file
                    Write-Host $fileUrl
                    $web.DownloadFile($fileUrl, "$PSScriptRoot\issues\" + $file)
                } Catch
                {
                    Write-Host "Ocorred an error trying download " + $file
                    $errorCount++
                }
            }
        }
    }
} else {
    #handle the single issue download
    do {
        switch ($1) {
            "-f" { $i=$1 }
            "-l" { issues=$1}
            "--" { break}
            "-*" {Write-Host "bad argument $1"}
            "*" { break}
            Default {}
        }
        break
    } While(true)

    do{
        $filePattern = "";
        if ($i -lt 10) {
            $filePattern = "MagPi0$i.pdf"
        } else {
            $filePattern = "MagPi$i.pdf"
        }

        try
        {
            Write-Host $env:appdata
            $fileUrl = $baseUrl + "/" + $filePattern
            Write-Host $fileUrl
            $web.DownloadFile($fileUrl, "$PSScriptRoot\issues\" + $filePattern)
        } Catch
        {
            Write-Host "Ocorred an error trying download " + $filePattern
            $errorCount++
        }

        $i++
     } While($1 -lt $issues)
}

if ($errorCount -gt 0) {
	exit 1
}