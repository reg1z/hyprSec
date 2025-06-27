#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

# Ensure the directory exists
sudo mkdir -p /etc/sddm.conf.d

# Copy sddm configuration
sudo cp -f assets/sddm/sddm.conf /etc/sddm.conf.d/sddm.conf

# Copy sddm reactionary theme
sudo cp -rf assets/sddm/themes/reactionary /usr/share/sddm/themes/
