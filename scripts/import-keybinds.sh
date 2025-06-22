#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

# Import kb configs only
cp -rf --remove-destination .config/hypr/conf/keybindings/* $USER_HOME/.config/hypr/conf/keybindings/*
