#!/bin/bash
# script1.sh - Display first 5 lines of a file given as command-line argument

if [ $# -eq 0 ]; then
    echo "Error: No filename provided."
    echo "Usage: $0 <filename>"
    exit 1
fi

filename="$1"

if [ -e "$filename" ]; then
    echo "First 5 lines of '$filename':"
    echo "-------------------------------"
    head -5 "$filename"
else
    echo "Error: File '$filename' does not exist."
    exit 1
fi
