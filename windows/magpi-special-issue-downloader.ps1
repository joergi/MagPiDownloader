# ------------------------------------------------------------------
# [Author] rubemlrm - https://github.com/joergi/MagPiDownloader
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=0.1.0
# USAGE="Usage: ./magpi-special-issue-downloader.ps1"

# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/MagPiDownloader
#          downloader for all MagPi issues
#          they are downloadable for free under https://www.raspberrypi.org/magpi/issues/
#          or you can buy the paper issues under: http://swag.raspberrypi.org/collections/magpi
#          this script is under GNU GENERAL PUBLIC LICENSE
# ------------------------------------------------------------------

# VERSION=0.1.0
# USAGE="Usage: pwshl magpi-special-issue-downloader.ps1"

$BASEDIR = Split-Path $MyInvocation.MyCommand.Path -Parent
$OUTDIR = Join-Path $BASEDIR "special_issues"

if (!(Test-Path $OUTDIR -PathType Container)) {
    New-Item -ItemType Directory -Path $OUTDIR | Out-Null
}

$file = Join-Path $BASEDIR "../sources-for-download/special-issues.txt"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/joergi/downloader/main/windows/downloader.ps1 -OutFile downloader.ps1

Get-Content $file | ForEach-Object {
    pwsh -Command ./downloader.ps1 -downloadUrl $_ -outputDir $OUTDIR

#    $downloaderScript = Invoke-WebRequest https://raw.githubusercontent.com/joergi/downloader/main/windows/downloader.ps1 -UseBasicParsing
#    $downloaderScriptContent = $downloaderScript.Content
#    & pwsh -Command "& {$downloaderScriptContent -downloadUrl $_ -outputDir $OUTDIR}"
#    pwsh -Command Invoke-WebRequest -Uri "https://raw.githubusercontent.com/joergi/downloader/main/windows/downloader.ps1 -downloadUrl $_ -outputDir $OUTDIR" -UseBasicParsing
}
Exit 0

