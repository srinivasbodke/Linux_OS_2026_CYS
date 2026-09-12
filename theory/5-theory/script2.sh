#!/bin/bash
# script2.sh - File Type and Permission Checker

if [ $# -eq 0 ]; then
    echo "Error: No path provided."
    echo "Usage: $0 <path>"
    exit 1
fi

path="$1"

if [ ! -e "$path" ]; then
    echo "Error: '$path' does not exist."
    exit 1
fi

echo "Checking: $path"
echo "-------------------------------"

if [ -f "$path" ]; then
    echo "-> It is a regular file."
elif [ -d "$path" ]; then
    echo "-> It is a directory."
else
    echo "-> It is neither a regular file nor a directory."
fi

if [ -r "$path" ]; then
    echo "-> It is readable."
else
    echo "-> It is NOT readable."
fi

if [ -w "$path" ]; then
    echo "-> It is writable."
else
    echo "-> It is NOT writable."
fi

if [ -x "$path" ]; then
    echo "-> It is executable."
else
    echo "-> It is NOT executable."
fi
