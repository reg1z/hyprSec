#!/bin/bash

SCRIPTS="scripts"
CURRENT_USER=$(whoami)
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")

defaultAppPackages=(
  "thunar"                   # file manager
  "gvfs"                     # file system support for thunar
  "thunar-archive-plugin"    # adds archive operations to thunar
  "thunar-media-tags-plugin" # adds "special features" for media files to thunar
  "thunar-volman"            # adds volume management to thunar
  "parole"                   # media player (gstreamer)
  "ristretto"                # image viewer
  "mousepad"                 # Simple text editor
  "xfce4-taskmanager"        # Task Manager
)

# Install required packages
sudo pacman -S --needed ${defaultAppPackages[@]}
