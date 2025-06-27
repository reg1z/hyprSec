#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

# Backup and wipe current neovim environment
source $SCRIPTS/vim/backup-nvim-cfg.sh
source $SCRIPTS/vim/wipe-nvim-cfg.sh

mkdir -p $USER_HOME/.config/nvim

# Clone the AstroVim Template
URL="https://github.com/AstroNvim/template"
git clone --depth 1 $URL $USER_HOME/.config/nvim
rm -rf $USER_HOME/.config/nvim/.git # Remove upstream git repo connection

# Installing tokyonight theme
cp -f $SCRIPTS/vim/astrovim_tokyonight/* $USER_HOME/.config/nvim/lua/plugins

# Headlessly install the LazyVim plugins
nvim --headless "+Lazy! sync" +qa
