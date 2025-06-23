#!/bin/bash
#set -euo pipefail

# Install tmux
sudo pacman -S tmux --noconfirm

# Import tmux configuration
cp -rf home/.tmux.conf $USER_HOME/.tmux.conf

# Ask if user wants to install tmux plugin manager
if gum confirm --default=false "Do you want to install tmux plugin manager? This is required for the tmux configuration to work."; then

  git clone https://github.com/tmux-plugins/tpm $USER_HOME/.tmux/plugins/tpm

  # Remove .git directory from tpm
  rm -rf $USER_HOME/.tmux/plugins/tpm/.git
fi

echo "Tmux installed successfully."
