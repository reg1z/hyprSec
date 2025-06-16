#!/bin/bash

# Arch Wiki information:
# - The default configuration for sddm can be found at `/usr/lib/sddm/sddm.conf.d/default.conf`
# - For changes, create new file(s) in `/etc/sddm.conf.d/`
#
# Theming:
# - The default theme directory is `/usr/share/sddm/themes/`. You can add your own folders containing new themes here.
# - Previewing themes: `sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/<theme-name>`
# - Note that SDDM requires these subdirectory names to be the same as the theme names.

pacman -S --needed sddm

# Copy sddm configuration
cp -f sddm/sddm.conf /etc/sddm.conf.d/sddm.conf

# Copy sddm reactionary theme
cp -rf sddm/themes/reactionary /usr/share/sddm/themes/

# Enable sddm service
systemctl enable sddm.service

# Start sddm service
systemctl start sddm

echo "SDDM installed and enabled. Please reboot or log out to see the changes."
