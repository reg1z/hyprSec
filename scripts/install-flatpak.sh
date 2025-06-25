#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

sudo pacman -S flatpak --needed --noconfirm
