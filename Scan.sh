# Termux File Scanner

#!/data/data/com.termux/files/usr/bin/bash

# Function to scan files
scan_files() {
    echo "Scanning files in the current directory..."
    find . -type f -print
}

# Execute the scan
scan_files
