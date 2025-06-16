#!/bin/bash
#set -euo pipefail

# Install tmux
pacman -S tmux

# Import tmux configuration
cp -rf  ../.tmux.conf ~/.tmux.conf

# Ask if user wants to install tmux plugin manager
if gum confirm --default=false "Do you want to install tmux plugin manager? This is required for the tmux configuration to work."; then

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # Remove .git directory from tpm
    rm -rf ~/.tmux/plugins/tpm/.git
fi

echo "Tmux installed successfully."

