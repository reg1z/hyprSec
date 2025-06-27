#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

# For ease of theming Qt-based applications

qtPackages=(
  "qt5-wayland"
  "qt6-wayland"
  "qt5ct"
  "qt6ct"
  "kvantum"
)


# Install required packages
sudo pacman -S --needed ${qtPackages[@]}
