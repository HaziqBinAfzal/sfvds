#!/bin/bash

FILE=$1
HASH_FILE="/tmp/${FILE//\//_}.hash"

NEW_HASH=$(sha256sum "$FILE" | awk '{print $1}')

if [ -f "$HASH_FILE" ]; then
    OLD_HASH=$(cat "$HASH_FILE")
    if [ "$NEW_HASH" = "$OLD_HASH" ]; then
        echo "NO_CHANGE"
        exit 0
    fi
fi

echo "$NEW_HASH" > "$HASH_FILE"
echo "CHANGED"
