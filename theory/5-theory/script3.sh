#!/bin/bash
# script3.sh - Search a log file for suspicious keywords

if [ $# -eq 0 ]; then
    echo "Error: No log file provided."
    echo "Usage: $0 <logfile>"
    exit 1
fi

logfile="$1"

if [ ! -f "$logfile" ]; then
    echo "Error: '$logfile' does not exist or is not a regular file."
    exit 1
fi

keywords=("failed" "denied" "unauthorized" "error")

echo "Scanning '$logfile' for suspicious keywords..."
echo "==============================================="

for word in "${keywords[@]}"; do
    count=$(grep -ic "$word" "$logfile")
    echo ""
    echo "Keyword: '$word'  -> $count match(es)"
    if [ "$count" -gt 0 ]; then
        grep -in --color=never "$word" "$logfile"
    fi
done
