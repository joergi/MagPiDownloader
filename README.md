# MagPiDownloader for Windows, Mac, Linux and Docker

[![HitCount](http://hits.dwyl.com/joergi/MagPiDownloader.svg)](http://hits.dwyl.com/joergi/MagPiDownloader) ![Test Scripts](https://github.com/joergi/MagPiDownloader/workflows/Test%20Scripts/badge.svg) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/6148b12808964799910ed67ce82065ce)](https://www.codacy.com/app/joergi/MagPiDownloader?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=joergi/MagPiDownloader&amp;utm_campaign=Badge_Grade)

All the issues are downloadable for free on [https://www.raspberrypi.org/magpi/issues/](https://www.raspberrypi.org/magpi/issues/)
You can also buy all the paper versions of this issues on [http://swag.raspberrypi.org/collections/magpi](http://swag.raspberrypi.org/collections/magpi)

This project should save you time, and let you download all scripts together.

## Windows user: [here is your tuturial](windows/)

## Linux and Mac user: [here is your tutorial](linux_mac/)

## Docker

If you have Docker installed, there is an easy way to download it by docker:  

download all:  

```bash
docker run -v $(pwd)/issues:/app/issues/ joergi/mag-pi-downloader
```

download specific range first to last (example: from 1 to 2

```bash
docker run -v $(pwd)/issues:/app/issues/ joergi/mag-pi-downloader -f 1 -l 2
```


(unfortunately the issues folder is root, so you have to change it to your user)

=======

```bash
docker run -v $(pwd)/issues:/app/issues/ joergi/mag-pi-downloader -f 1 -l 2
```


```bash
sudo chown $USER:$USER -R issues/
```
