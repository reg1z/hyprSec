#!/usr/bin/env bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

BACKUPS=$USER_HOME/Backups

# Backup .config directory with timestamp
set -euo pipefail

# Create dotfiles-bak directory if it doesn't exist

# Generate timestamp in YY-MM-DD_HH-MM-SS (year-month-day_hour-minute-second)
timestamp=$(date +"%y-%m-%d_%H-%M-%S")
backup_dir=$BACKUPS/full_dotconfig_backup_"$timestamp"

# Create backup directory
mkdir -p $BACKUPS
mkdir -p "$backup_dir"

# Copy .config to backup location
cp -r $USER_HOME/.config "$backup_dir"

# Backup bash configuration files
cp -f $USER_HOME/.*profile $USER_HOME/.*rc "$backup_dir" 2>/dev/null || true

echo "Dotfiles (including shell profiles and .rc files in $USER_HOME) backed up to $backup_dir."
