#!/bin/bash
# Zanncer 2.0 - Recursive file scan with sizes for UserLAnd/Kali

echo "Starting recursive scan in: $PWD"
SCAN_LOG="$HOME/zanncer_scan.log"
echo "Scan started at $(date)" > "$SCAN_LOG"

# Function to scan a directory recursively
scan_dir() {
    local dir="$1"
    # Loop through all files and folders in the current directory
    for file in "$dir"/* "$dir"/.[!.]* 2>/dev/null; do
        [ -e "$file" ] || continue  # Skip if nothing matches

        if [ -d "$file" ]; then
            # If it's a directory, recurse into it
            scan_dir "$file"
        else
            # If it's a file, get human-readable size
            size=$(du -h "$file" 2>/dev/null | cut -f1)
            echo "$file - $size" | tee -a "$SCAN_LOG"
        fi
    done
}

# Start scanning from the current directory
scan_dir "$PWD"

echo "Scan completed at $(date)" | tee -a "$SCAN_LOG"
echo "All accessible files have been logged to $SCAN_LOG"
