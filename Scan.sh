# Zanncer-2.0
# Kali Linux Device Scanner

#!/bin/bash

# Function to scan device files
scan_devices() {
    echo "Scanning device files..."
    ls /dev > devices.txt
    cat devices.txt
}

# Function to display details
show_details() {
    echo "Made by: BROLKAO on Git"
}

# Main execution
trap 'echo "An error occurred. Exiting..."; exit 1;' ERR

if [[ $1 == "--details" ]]; then
    show_details
else
    scan_devices
fi
