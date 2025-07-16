#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

mkdir -p $USER_HOME/.config/qutebrowser

# Copy configuration to ~/.config and home directory
cp -rf --remove-destination .config/qutebrowser/* $USER_HOME/.config/qutebrowser
