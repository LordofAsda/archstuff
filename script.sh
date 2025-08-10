#!/bin/bash

# Check if the file exists
if [[ ! -f pacman_packages.txt ]]; then
    echo "Error: pacman_packages.txt not found!"
    exit 1
fi

# Read file, replace commas with spaces, trim leading/trailing spaces
packages=$(cat pacman_packages.txt | tr ',' ' ' | xargs)

# Confirm action with user
echo "The following packages will be installed:"
echo "$packages"
read -p "Proceed? (y/N): " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
    sudo pacman -S --needed $packages
else
    echo "Cancelled."
fi
