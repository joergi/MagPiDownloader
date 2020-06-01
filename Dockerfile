FROM alpine
RUN apk add wget bash curl sed grep
COPY linux_mac /app/linux_mac
COPY sources-for-download /app/
RUN chmod -R 777 /app/*
ENTRYPOINT ["/app/linux_mac/magpi-issue-downloader.sh"]
