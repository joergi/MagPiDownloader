FROM alpine:latest

RUN apk add --no-cache su-exec curl wget bash

COPY sources-for-download /app/sources-for-download
COPY linux_mac /app/linux_mac
COPY --chmod=755 entrypoint.sh /app/entrypoint.sh

VOLUME /app/issues

ENTRYPOINT ["/bin/sh", "/app/entrypoint.sh"]
