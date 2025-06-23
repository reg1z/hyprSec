#!/bin/bash

# Script to enable Arch Linux multilib repository
# This script modifies /etc/pacman.conf to uncomment the [multilib] section

set -euo pipefail # Exit on error, undefined vars, and pipe failures

PACMAN_CONF="/etc/pacman.conf"
BACKUP_SUFFIX=".backup-$(date +%Y%m%d-%H%M%S)"

# Function to print colored output
print_info() {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

print_success() {
  echo -e "\033[1;32m[SUCCESS]\033[0m $1"
}

print_error() {
  echo -e "\033[1;31m[ERROR]\033[0m $1"
}

print_warning() {
  echo -e "\033[1;33m[WARNING]\033[0m $1"
}

# Check if running as root
if [[ $EUID -ne 0 ]]; then
  print_error "This script must be run as root (use sudo)"
  exit 1
fi

# Check if pacman.conf exists
if [[ ! -f "$PACMAN_CONF" ]]; then
  print_error "pacman.conf not found at $PACMAN_CONF"
  exit 1
fi

# Check if multilib is already enabled
if grep -q "^\[multilib\]" "$PACMAN_CONF"; then
  print_warning "Multilib repository appears to already be enabled"
  print_info "Current multilib section:"
  grep -A 2 "^\[multilib\]" "$PACMAN_CONF" || true

  read -p "Do you want to continue anyway? (y/N): " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_info "Operation cancelled"
    exit 0
  fi
fi

print_info "Creating backup of pacman.conf..."
cp "$PACMAN_CONF" "${PACMAN_CONF}${BACKUP_SUFFIX}"
print_success "Backup created: ${PACMAN_CONF}${BACKUP_SUFFIX}"

print_info "Enabling multilib repository..."

# Use sed to uncomment the [multilib] section and the Include line that follows
# This handles the most common case where multilib is commented out
sed -i '/^#\[multilib\]/,/^#Include/ {
    s/^#\[multilib\]/[multilib]/
    s/^#Include = /Include = /
}' "$PACMAN_CONF"

# Verify the changes were made
if grep -q "^\[multilib\]" "$PACMAN_CONF"; then
  print_success "Multilib repository has been enabled!"
  print_info "Enabled section:"
  grep -A 2 "^\[multilib\]" "$PACMAN_CONF"

  print_info "Updating package database..."
  if pacman -Sy; then
    print_success "Package database updated successfully"
    print_info "You can now install 32-bit packages using pacman"
    print_info "Example: pacman -S lib32-mesa"
  else
    print_error "Failed to update package database"
    print_warning "You may need to run 'pacman -Sy' manually"
  fi
else
  print_error "Failed to enable multilib repository"
  print_info "Please check $PACMAN_CONF manually"
  print_info "You may need to manually uncomment the [multilib] section"
  exit 1
fi

print_info "Script completed successfully!"
print_info "Backup file: ${PACMAN_CONF}${BACKUP_SUFFIX}"
