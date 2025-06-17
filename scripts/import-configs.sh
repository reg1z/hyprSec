#!/bin/bash
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
cp -f home/.* $USER_HOME/

# Copy wallpapers to ~/Pictures/wallpapers/
mkdir -p $USER_HOME/Pictures/wallpapers
cp -rf assets/wallpapers/* $USER_HOME/Pictures/wallpapers/
