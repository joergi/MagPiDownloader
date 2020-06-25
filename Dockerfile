FROM alpine:3.12.0
RUN apk add wget bash curl sed grep --no-cache
COPY linux_mac /app/linux_mac
COPY issues.txt /app/
RUN chmod -R 777 /app/*
ENTRYPOINT ["/app/linux_mac/magpi-issue-downloader.sh"]
