#!/bin/bash

# Copy configuration to ~/.config and home directory
cp -rf --remove-destination ../.config/hypr/* ~/.config/hypr
cp -rf --remove-destination ../.config/waybar/* ~/.config/waybar
cp -rf --remove-destination ../.config/rofi/* ~/.config/rofi
cp -rf --remove-destination ../.config/mako/* ~/.config/mako
cp -rf --remove-destination ../.config/kitty/* ~/.config/kitty
cp -f  ../home/.* ~/

# Copy wallpapers to ~/Pictures/wallpapers/
cp -rf ../assets/wallpapers/* ~/Pictures/wallpapers/