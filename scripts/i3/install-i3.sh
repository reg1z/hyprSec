#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

sudo pacman -S --needed --noconfirm i3-wm i3status i3lock autotiling xorg-xsetroot feh
source $SCRIPTS/i3/import-i3-configs.sh
