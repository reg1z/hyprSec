#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

sudo pacman -S --needed keyd                                             # install keyd if not present already
sudo cp -i $SCRIPTS/keyd/laptop_layout.conf /etc/keyd/laptop_layout.conf # place KB config into correct directory
sudo systemctl enable keyd
sudo systemctl start keyd
