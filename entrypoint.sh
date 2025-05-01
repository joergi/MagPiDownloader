#!/bin/sh

set -e

# Default to 1000:1000 as per the original behaviour.
export PUID=${PUID:-1000}
export PGID=${PGID:-1000}
export IS_DOCKER=true

# Set privileges for /app/issues but only if pid 1 user is root and we are dropping privileges.
# If container is run as an unprivileged user, it means owner already handled ownership setup on their own.
# Running chown in that case (as non-root) will cause error
[ "$(id -u)" == "0" ] && [ "${PUID}" != "0" ] && chown -R ${PUID}:${PGID} /app/issues

# Drop privileges (when asked to) if root, otherwise run as current user
if [ "$(id -u)" == "0" ] && [ "${PUID}" != "0" ]; then
    su-exec ${PUID}:${PGID} bash /app/linux_mac/magpi-issue-downloader.sh "$@"
else
    exec bash /app/linux_mac/magpi-issue-downloader.sh "$@"
fi
