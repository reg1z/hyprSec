#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

mkdir -p $USER_HOME/.config/xdg-desktop-portal

cp -rf --remove-destination .config/xdg-desktop-portal/* $USER_HOME/.config/xdg-desktop-portal
sudo cp -f $SCRIPTS/xdg/applications.menu /etc/xdg/menus # /etc/xdg/menus/applications.menu is necessary for applications to populate the app chooser in KDE apps like dolphin
