#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

defaultAppPackages=(
  "gwenview" # image viewer
  "kcalc" # calculator
  "okular" # PDF / doc viewer
  "dolphin" # file manager
  "ark" # archiving tool
  "kate" # simple text editor
  "haruna" # media player
  "qps" # process/task manager
)

# Install required packages
sudo pacman -S --needed ${defaultAppPackages[@]}

# Disable unnecessary KDE baloo file indexer
balooctl disable

# oldChoices=(
#   "thunar"            # file manager
#   "gvfs"              # file system support for thunar
#   "loupe"             # image viewer
#   "vlc"               # media player
# )
