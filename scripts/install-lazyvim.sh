#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

mkdir -p $USER_HOME/.config/nvim

# Clone the LazyVim starter configuration
git clone https://github.com/LazyVim/starter $USER_HOME/.config/nvim
rm -rf $USER_HOME/.config/nvim/.git

# Headlessly install the LazyVim plugins
nvim --headless "+Lazy! sync" +qa

# Headlessly run :LazyHealth
nvim --headless "+LazyHealth" "+qa"
