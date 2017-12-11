#!/bin/bash
# ------------------------------------------------------------------
# [Author] rubemlrm - https://github.com/joergi/MagPiDownloader
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=0.1.0
# USAGE="Usage: ./magpi-special-issue-downloader.ps1"


# Check if directory dont exist and try create
if( -Not (Test-Path -Path "special_issues" ) )
{
    New-Item -ItemType directory -Path "special_issues"
}

$special_issues = @(
    "Essentials_Games_v1.pdf",
    "Projects_Book_v1.pdf",
    "Projects_Book_v2.pdf",
    "Projects_Book_v3.pdf",
    "Essentials_Bash_v1.pdf",
    "Essentials_SenseHAT_v1.pdf",
    "Essentials_Sonic_Pi-v1.pdf",
    "Essentials_Scratch_v1.pdf",
    "Essentials_Minecraft_v1.pdf",
    "Essentials_GPIOZero_v1.pdf",
    "Essentials_C_v1.pdf",
    "Essentials_Camera_v1.pdf",
    "Essentials_AIY_Projects_Voice_v1.pdf",
    "Beginners_Book_v1.pdf"
)

$baseUrl="https://www.raspberrypi.org/magpi-issues"
$web = New-Object system.net.webclient
$errorCount = 0
foreach($issue in $special_issues)
{
      try
                {
                    Write-Host $env:appdata
                    $fileUrl = $baseUrl + "/" + $issue
                    Write-Host $fileUrl
                    $web.DownloadFile($fileUrl, "$PSScriptRoot\special_issues\\$issue")
                } Catch
                {
                    Write-Host "Ocorred an error trying download " + $file
                    $errorCount++
                }
}

if ($errorCount -gt 0) {
	exit 1
}
