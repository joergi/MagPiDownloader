# ------------------------------------------------------------------
# [Author] rubemlrm - https://github.com/joergi/MagPiDownloader
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=0.1.0
# USAGE="Usage: ./magpi-issue-downloader-spanish.ps1"


$i=1
$issues=3
$baseUrl="https://www.raspberrypi.org/magpi-issues"
$web = New-Object system.net.webclient
# Check if directory dont exist and try create
if( -Not (Test-Path -Path "spanish_issues" ) )
{
    New-Item -ItemType directory -Path "spanish_issues"
}

while ($i -le $issues)
{
	$filePattern = "";
	if ($i -lt 10) {
		$filePattern = "MagPi_Mini_Spanish_0$i.pdf"
	} else {
		$filePattern = "MagPi_Mini_Spanish_$i.pdf"
	}

	try
	{
		Write-Host Downloading $filePattern
		$fileUrl = $baseUrl + "/" + $filePattern
		$web.DownloadFile($fileUrl, "$PSScriptRoot\spanish_issues\\$filePattern")
	} Catch
	{
		Write-Host "Ocorred an error trying download " + $filePattern
		exit 1
	}
	$i++
}

