#!/bin/bash
# investigate.sh - Interactive log investigation tool

if [ $# -eq 0 ]; then
    echo "Error: No log file provided."
    echo "Usage: $0 <logfile>"
    exit 1
fi

logfile="$1"

if [ ! -e "$logfile" ]; then
    echo "Error: '$logfile' does not exist."
    exit 1
fi

if [ ! -r "$logfile" ]; then
    echo "Error: '$logfile' is not readable."
    exit 1
fi

echo "Log file '$logfile' verified: exists and is readable."
echo ""
read -p "Enter search term: " term

if [ -z "$term" ]; then
    echo "Error: No search term entered."
    exit 1
fi

total=$(grep -ic -- "$term" "$logfile")

echo ""
echo "Top 5 matching records for '$term':"
echo "-------------------------------------"
grep -i -- "$term" "$logfile" | head -5

echo ""
echo "Total matching records: $total"
