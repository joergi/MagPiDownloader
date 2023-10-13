#!/bin/bash
echo "hello"
# Create the 'issues' directory with non-root ownership
#mkdir -p /app/issues
#chown myuser:myuser /app/issues
#chown -R myuser:myuser /app/linux_mac/magpi-issue-downloader.sh
# List the contents of /app and /app/linux_mac for debugging

ls -lah /app/linux_mac

# Execute the main command
echo "pwd"
pwd
ls -lah
echo "\n\n /app"
ls -lah /app

echo "\n\n /app/linux_mac"
ls -lah /app/linux_mac
echo "hello in entry point"
bash /app/linux_mac/magpi-issue-downloader.sh "$@"
