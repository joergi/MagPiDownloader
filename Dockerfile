FROM alpine:3.12.0

# hadolint disable=DL3018
RUN apk add wget bash curl sed grep --no-cache

COPY linux_mac /app/linux_mac
COPY sources-for-download /app/
RUN chmod -R 777 /app/*
ENTRYPOINT ["/app/linux_mac/magpi-issue-downloader.sh"]
