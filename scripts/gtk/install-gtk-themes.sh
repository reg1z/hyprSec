#!/bin/bash

SCRIPTS="scripts"
CURRENT_USER=$(whoami)
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")

defaultAppPackages=(
  "nwg-look"
  "adapta-gtk-theme"
  "breeze-gtk"
  "breeze-icons"
)

# Install required packages
sudo pacman -S --needed ${defaultAppPackages[@]}
