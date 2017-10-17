# ------------------------------------------------------------------
# [Author] rubemlrm - https://github.com/joergi/MagPiDownloader
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=0.1.0
# USAGE="Usage: ./magpi-education-downloader.ps1"


$i=1
$issues=2
$baseUrl="https://www.raspberrypi.org/magpi-issues"
$web = New-Object system.net.webclient
# Check if directory dont exist and try create
if( -Not (Test-Path -Path "education_issues" ) )
{
    New-Item -ItemType directory -Path "education_issues"
}

while ($i -le $issues)
{
	$filePattern = "";
	if ($i -lt 10) {
		$filePattern = "MagPi-EduEdition0$i.pdf"
	} else {
		$filePattern = "MagPi-EduEdition$i.pdf"
	}

	try
	{
		Write-Host Downloading $filePattern
		$fileUrl = $baseUrl + "/" + $filePattern
		$web.DownloadFile($fileUrl, "$PSScriptRoot\education_issues\" + $filePattern)
	} Catch
	{
		Write-Host "Ocorred an error trying download " + $filePattern
		exit 1
	}
	$i++
}
