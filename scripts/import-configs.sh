#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

mkdir -p $USER_HOME/.config/hypr
mkdir -p $USER_HOME/.config/waybar
mkdir -p $USER_HOME/.config/rofi
mkdir -p $USER_HOME/.config/mako
mkdir -p $USER_HOME/.config/kitty
mkdir -p $USER_HOME/.config/Kvantum
mkdir -p $USER_HOME/.config/qt6ct
mkdir -p $USER_HOME/.config/qt5ct
mkdir -p $USER_HOME/.config/gtk-3.0
mkdir -p $USER_HOME/.config/gtk-4.0

# Copy configuration to ~/.config and home directory
cp -rf --remove-destination .config/hypr/* $USER_HOME/.config/hypr
cp -rf --remove-destination .config/waybar/* $USER_HOME/.config/waybar
cp -rf --remove-destination .config/rofi/* $USER_HOME/.config/rofi
cp -rf --remove-destination .config/mako/* $USER_HOME/.config/mako
cp -rf --remove-destination .config/kitty/* $USER_HOME/.config/kitty
cp -rf --remove-destination .config/Kvantum/* $USER_HOME/.config/Kvantum
cp -rf --remove-destination .config/qt6ct/* $USER_HOME/.config/qt6ct
cp -rf --remove-destination .config/qt5ct/* $USER_HOME/.config/qt5ct
cp -rf --remove-destination .config/gtk-3.0/* $USER_HOME/.config/gtk-3.0
cp -rf --remove-destination .config/gtk-4.0/* $USER_HOME/.config/gtk-4.0
cp -rf home/.* $USER_HOME/

# Copy wallpapers to ~/Pictures/wallpapers/
mkdir -p $USER_HOME/Pictures/wallpapers
mkdir -p $USER_HOME/.local
mkdir -p $USER_HOME/.local/share
mkdir -p $USER_HOME/.local/share/icons

cp -rf assets/wallpapers/* $USER_HOME/Pictures/wallpapers/
cp -rf assets/hyprcursor_themes/* $USER_HOME/.local/share/icons

# Enables kitty in dolphin right-click "open terminal" menu
cp -f .config/kdeglobals $USER_HOME/.config

# Service-specific scripts
source $SCRIPTS/uwsm/import-uwsm.sh # Import uwsm environment variables
source $SCRIPTS/xdg/import-xdg-configs.sh
