#!/bin/sh

# Create the 'issues' directory with non-root ownership
mkdir -p /app/issues
chown myuser:myuser /app/issues

# List the contents of /app and /app/linux_mac for debugging
ls -lah /app
ls -lah /app/linux_mac

# Execute the main command
exec /app/linux_mac/magpi-issue-downloader.sh "$@"
