#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

rm -rf $USER_HOME/.config/nvim
rm -rf $USER_HOME/.local/share/nvim
rm -rf $USER_HOME/.local/state/nvim
rm -rf $USER_HOME/.cache/nvim
