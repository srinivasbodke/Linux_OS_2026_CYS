#!/bin/bash
# script4.sh - Check file existence, type, and emptiness

if [ $# -eq 0 ]; then
    echo "Error: No filename provided."
    echo "Usage: $0 <filename>"
    exit 1
fi

filename="$1"

if [ ! -e "$filename" ]; then
    echo "Error: '$filename' does not exist."
    exit 1
fi
echo "'$filename' exists."

if [ -f "$filename" ]; then
    echo "'$filename' is a regular file."
else
    echo "'$filename' is not a regular file."
    exit 1
fi

if [ -s "$filename" ]; then
    echo "'$filename' is non-empty."
    echo "First 5 lines:"
    echo "-------------------------------"
    head -5 "$filename"
else
    echo "'$filename' is empty."
fi
