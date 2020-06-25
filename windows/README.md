![](https://travis-ci.org/joergi/MagPiDownloader.svg?branch=master) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/6148b12808964799910ed67ce82065ce)](https://www.codacy.com/app/joergi/MagPiDownloader?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=joergi/MagPiDownloader&amp;utm_campaign=Badge_Grade)

# MagPiDownloader for Windows
Downloads all the Mag Pi issues (a Raspberry Pi magazine) on Windows

Open your Powershell as Administrator (right click on PowerShell -> Open as Administrator)
Enter: `set-executionpolicy remotesigned`
and you are able to use the Powershell scripts.
All Windows scripts are done by [github user Rubemlrm](https://github.com/Rubemlrm)


  `git clone https://github.com/joergi/MagPiDownloader.git`

Download the normal issues:
  `./magpi-issue-downloader.ps1`

~~Download a specific range of normal issues:
  `./magpi-issue-downloader.ps1 -f 42 -l 52`~~
  (not working yet, will be fixed soon)

Download the special issues / books
  `./magpi-special-issue-downloader.ps1`

Download the education issues
  `./magpi-education-downloader.ps1`

Télécharger les traductions françaises:
  `./magpi-issue-downloader_french.ps1`

Scarica i temi tradotti traduzione:
  `./magpi-issue-downloader_french.ps1`

Descargue la traducción española:
  `./magpi-issue-downloader_spanish.ps1`

הורד את הבעיות מתורגמות העבריות:
  `./magpi-issue-downloader_hebrew.ps1`

All the issues are downloadable for free on https://www.raspberrypi.org/magpi/issues/
You can also buy all the paper versions of this issues on http://swag.raspberrypi.org/collections/magpi

## You want to download it with Docker? [Go here for the Docker version](../)
## You don't have a Windows? [Go here for the Mac or Linux version](../linux_mac/)
