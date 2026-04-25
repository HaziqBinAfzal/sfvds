#!/bin/bash

WATCH_DIR=~/sfvds
LAST_EVENT_TIME=0

inotifywait -m "$WATCH_DIR" -e modify |
while read path action file; do
    NOW=$(date +%s)

    # ignore spam triggers within 1 second
    if (( NOW - LAST_EVENT_TIME < 1 )); then
        continue
    fi

    LAST_EVENT_TIME=$NOW

    FULL_PATH="$WATCH_DIR/$file"

    if [ -f "$FULL_PATH" ]; then
        echo "Detected change: $file"
        ./scripts/auto_backup.sh "$FULL_PATH"
    fi
done
