#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

# Import i3 configs only
cp -rf -v .config/i3 $USER_HOME/.config/
cp -rf -v .config/i3status $USER_HOME/.config/
cp -rf -v .config/picom $USER_HOME/.config/
