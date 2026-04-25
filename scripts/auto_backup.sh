#!/bin/bash

FILE=$1

cd ~/sfvds || exit

RESULT=$(./scripts/has_changed.sh "$FILE")

if [ "$RESULT" = "CHANGED" ]; then
    echo "CHANGED → backing up $FILE"
    ./scripts/version_file.sh "$FILE"
else
    echo "NO CHANGE → skipping"
fi
