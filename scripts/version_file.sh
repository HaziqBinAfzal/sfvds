#!/bin/bash

FILE=$1

mkdir -p ~/sfvds/versions

TIMESTAMP=$(date +%s)
BASENAME=$(basename "$FILE")

cp "$FILE" ~/sfvds/versions/${BASENAME}_${TIMESTAMP}

echo "$(date) | BACKUP | $FILE | $TIMESTAMP" >> ~/sfvds/logs/activity.log
