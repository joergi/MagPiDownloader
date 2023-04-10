# MagPiDownloader for Windows

Downloads all the Mag Pi issues (a Raspberry Pi magazine) on Windows

Open your Powershell as Administrator (right click on PowerShell -> Open as Administrator)
Enter: `set-executionpolicy remotesigned`
and you are able to use the Powershell scripts.
The original Windows scripts was programmed by [GitHub user Rubemlrm](https://github.com/Rubemlrm)
The new rewritten code is now programmed by [Github user Jaykul](https://github.com/Jaykul)


  `git clone https://github.com/joergi/MagPiDownloader.git`

Download the normal issues:
  `./magpi-issue-downloader.ps1`

Download a specific range of normal issues:
  `./magpi-issue-downloader.ps1 -f 42 -l 52`

Download the special issues / books
  `./magpi-special-issue-downloader.ps1`

=======
All the issues are downloadable for free on [https://www.raspberrypi.org/magpi/issues/](https://www.raspberrypi.org/magpi/issues/)
You can also buy all the paper versions of this issues on [https://swag.raspberrypi.org/collections/magpi](https://swag.raspberrypi.org/collections/magpi)

## You want to download it with Docker? [Go here for the Docker version](../)
## You don't have a Windows? [Go here for the Mac or Linux version](../linux_mac/)
