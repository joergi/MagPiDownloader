# Docker

## Docker - needs to be fixed - issue [[89](https://github.com/joergi/MagPiDownloader/issues/89), [26](https://github.com/joergi/MagPiDownloader/issues/26), [25](https://github.com/joergi/MagPiDownloader/issues/25), [42](https://github.com/joergi/MagPiDownloader/issues/42)]


If you have Docker installed, there is an easy way to download it by docker:

download all:

```bash
docker run -v $(pwd)/issues:/app/issues/ joergi/mag-pi-downloader
```

download specific range first to last (example: from 1 to 2

```bash
docker run -v $(pwd)/issues:/app/issues/ -u $(id -u):$(id -g) magpidownloader -f 1 -l 2
docker run -v $(pwd)/issues:/app/issues/ joergi/mag-pi-downloader -f 1 -l 2
```

To download special issues (books), the type argument can be used:

```bash
docker run -v $(pwd)/special_issues:/app/issues/ -u $(id -u):$(id -g) magpidownloader -t special
docker run -v $(pwd)/special_issues:/app/issues/ joergi/mag-pi-downloader -t special
```

(unfortunately the issues folder is root, so you have to change it to your user)

=======

```bash
docker run -v $(pwd)/issues:/app/issues/ joergi/mag-pi-downloader -f 1 -l 2
```


```bash
sudo chown $USER:$USER -R issues/
```
