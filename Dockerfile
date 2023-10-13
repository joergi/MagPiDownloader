# Stage 1: Build stage
FROM alpine:latest as builder

# hadolint disable=DL3018
ARG UID=1000
ARG GID=1000

RUN addgroup -g ${GID} myuser && adduser -u ${UID} -G myuser -D myuser

RUN apk update && apk add --no-cache sudo

RUN echo "myuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER myuser

RUN sudo apk add --no-cache wget bash curl sed grep

COPY sources-for-download /app/sources-for-download

# Stage 2: Final stage
#FROM alpine:latest
FROM ubuntu:latest

ARG UID=1000
ARG GID=1000

#RUN addgroup -g ${GID} myuser && adduser -u ${UID} -G myuser -D myuser
RUN groupadd -g ${GID} myuser && useradd -u ${UID} -g myuser -m myuser
RUN apt-get update && apt-get install -y curl wget
# Create the 'issues' directory with desired ownership inside the container
RUN mkdir -p /app/issues \
    && chown -R myuser:myuser /app/issues

COPY --from=builder /app/sources-for-download /app/sources-for-download
COPY linux_mac /app/linux_mac
RUN chown -R myuser:myuser /app/linux_mac

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

USER myuser

ENTRYPOINT ["/bin/sh", "/app/entrypoint.sh"]
