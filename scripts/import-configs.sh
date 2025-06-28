#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

mkdir -p $USER_HOME/.config/hypr
mkdir -p $USER_HOME/.config/waybar
mkdir -p $USER_HOME/.config/rofi
mkdir -p $USER_HOME/.config/mako
mkdir -p $USER_HOME/.config/kitty

# Copy configuration to ~/.config and home directory
cp -rf --remove-destination .config/hypr/* $USER_HOME/.config/hypr
cp -rf --remove-destination .config/waybar/* $USER_HOME/.config/waybar
cp -rf --remove-destination .config/rofi/* $USER_HOME/.config/rofi
cp -rf --remove-destination .config/mako/* $USER_HOME/.config/mako
cp -rf --remove-destination .config/kitty/* $USER_HOME/.config/kitty
cp -rf home/.* $USER_HOME/

# Copy wallpapers to ~/Pictures/wallpapers/
mkdir -p $USER_HOME/Pictures/wallpapers
cp -rf assets/wallpapers/* $USER_HOME/Pictures/wallpapers/
cp -rf assets/hyprcursor_themes/* $USER_HOME/.local/share/icons

source $SCRIPTS/uwsm/import-uwsm.sh # Import uwsm environment variables
