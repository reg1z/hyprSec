#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

sudo pacman -S --needed neovim

echo "Success. Neovim has been installed."

if gum confirm --default=false "$(echo -e "WARNING:\nIf you select 'YES', your ~/.config/nvim folder will be wiped.\nEnsure you've made backups if desired!\n\nDo you want to install LazyVim as your Neovim configuration?\nConfig files will be sourced from the Github repo.")"; then
  rm -rf $USER_HOME/.config/nvim
  source $SCRIPTS/install-lazyvim.sh
fi
