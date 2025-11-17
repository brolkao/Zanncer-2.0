#!/bin/bash
# Zanncer 2.0 - Recursive file scan with 3D title and colors

# ANSI color codes
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
RESET="\e[0m"

# 3D ASCII Title with color
echo -e "${CYAN} ________  ________  ________   ________   ________  _______   ________           _______      ________"
echo -e "${CYAN}|\_____  \|\   __  \|\   ___  \|\   ___  \|\   ____\|\  ___ \ |\   __  \         /  ___  \    |\   __  \\"
echo -e "${CYAN} \|___/  /\ \  \|\  \ \  \\ \  \ \  \\ \  \ \  \___|\ \   __/|\ \  \|\  \       /__/|_/  /|   \ \  \|\  \\"
echo -e "${CYAN}     /  / /\ \   __  \ \  \\ \  \ \  \\ \  \ \  \    \ \  \_|/_\ \   _  _\      |__|//  / /    \ \  \\\  \\"
echo -e "${CYAN}    /  /_/__\ \  \ \  \ \  \\ \  \ \  \\ \  \ \  \____\ \  \_|\ \ \  \\  \|         /  /_/__  __\ \  \\\  \\"
echo -e "${CYAN}   |\________\ \__\ \__\ \__\\ \__\ \__\\ \__\ \_______\ \_______\ \__\\ _\        |\________\\__\ \_______\\"
echo -e "${CYAN}    \|_______|\|__|\|__|\|__| \|__|\|__| \|__|\|_______|\|_______|\|__|\|__|        \|_______\|__|\|_______|${RESET}"
echo ""

# Set log file
SCAN_LOG="$HOME/zanncer_scan.txt"
echo "Scan started at $(date)" > "$SCAN_LOG"

# Recursive scan function
scan_dir() {
    local dir="$1"
    for file in "$dir"/* "$dir"/.[!.]*; do
        [ -e "$file" ] || continue
        if [ -d "$file" ]; then
            scan_dir "$file"
        else
            # Get file size in human-readable format
            size=$(du -h "$file" 2>/dev/null | cut -f1)
            # Choose color based on size (optional)
            if [[ "$size" == *G ]]; then
                color=$RED
            elif [[ "$size" == *M ]]; then
                color=$YELLOW
            else
                color=$GREEN
            fi
            echo -e "${color}$file - $size${RESET}" | tee -a "$SCAN_LOG"
        fi
    done
}

# Start scanning from current directory
scan_dir "$PWD"

echo -e "${CYAN}Scan completed at $(date)${RESET}" | tee -a "$SCAN_LOG"
echo -e "${CYAN}All accessible files have been logged to $SCAN_LOG${RESET}" chmod +x scan.sh
