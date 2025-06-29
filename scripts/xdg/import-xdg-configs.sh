#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

mkdir -p $USER_HOME/.config/xdg-desktop-portal
sudo mkdir -p $USER_HOME/.config/xdg/menus
sudo chmod 755 $USER_HOME/.config/xdg/menus

cp -rf --remove-destination .config/xdg-desktop-portal/* $USER_HOME/.config/xdg-desktop-portal
sudo cp -f $SCRIPTS/xdg/applications.menu /etc/xdg/menus/applications.menu # /etc/xdg/menus/applications.menu is necessary for applications to populate the app chooser in KDE apps like dolphin
