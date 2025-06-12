#!/usr/bin/env bash

# Backup .config directory with timestamp
set -euo pipefail

# Create dotfiles-bak directory if it doesn't exist
mkdir -p ~/dotfiles-bak

# Generate timestamp in YY-MM-DD-HH-MM-SS format
timestamp=$(date +"%y-%m-%d-%H-%M-%S")

# Name of the backup directory
backup_dir=~/dotfiles-bak/dotconfig_"$timestamp"

# Create backup directory
mkdir -p "$backup_dir"

# Copy .config to backup location
cp -r ~/.config "$backup_dir"

# Backup bash configuration files
cp -f ~/.*profile ~/.*rc "$backup_dir" 2>/dev/null || true

echo "Dotfiles backed up to $backup_dir"