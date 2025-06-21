#!/usr/bin/env bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

# Backup .config directory with timestamp
set -euo pipefail

# Create dotfiles-bak directory if it doesn't exist
mkdir -p $USER_HOME/dotfiles-bak

# Generate timestamp in YY-MM-DD-HH-MM-SS format
timestamp=$(date +"%y-%m-%d-%H-%M-%S")

# Name of the backup directory
backup_dir=$USER_HOME/dotfiles-bak/dotconfig_"$timestamp"

# Create backup directory
mkdir -p "$backup_dir"

# Copy .config to backup location
cp -r $USER_HOME/.config "$backup_dir"

# Backup bash configuration files
cp -f $USER_HOME/.*profile $USER_HOME/.*rc "$backup_dir" 2>/dev/null || true

echo "Dotfiles backed up to $backup_dir"
