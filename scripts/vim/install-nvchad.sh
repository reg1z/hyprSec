#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

# Backup and wipe current neovim environment
source $SCRIPTS/vim/backup-nvim-cfg.sh
source $SCRIPTS/vim/wipe-nvim-cfg.sh

mkdir -p $USER_HOME/.config/nvim

# Clone the NvChad starter configuration
URL="https://github.com/NvChad/starter"
git clone $URL $USER_HOME/.config/nvim
rm -rf $USER_HOME/.config/nvim/.git # Remove upstream git repo connection

# Headlessly install the LazyVim plugins
nvim --headless "+Lazy! sync" +qa

nvim --headless "+MasonInstallAll" +qa
