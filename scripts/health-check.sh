#!/bin/bash

DISK_THRESHOLD=80

disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Disk usage: ${disk_usage}%"

if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
    echo "WARNING: disk usage above ${DISK_THRESHOLD}%"
else
    echo "OK: disk usage within threshold"
fi