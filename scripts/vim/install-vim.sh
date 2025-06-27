#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

nvim_distro=$(gum choose "I want Neovim alone." "I want OG Vim." "I prefer Vi. Lul." "LazyVim" "AstroNvim" "NvChad" --header="Would you like to install a specific nvim distro?")
if [ -n "$nvim_distro" ]; then
  case "$nvim_distro" in
  "I want Neovim alone.")
    echo "Installing plain Neovim..."
    sudo pacman -S --needed neovim --noconfirm
    echo "Success. Neovim is installed."
    ;;
  "I want OG Vim.")
    echo "Installing Vim..."
    sudo pacman -S --needed vim --noconfirm
    echo "Success. Vim is installed."
    ;;
  "I prefer Vi. Lul.")
    echo "Installing Vi..."
    sudo pacman -S --needed vi --noconfirm
    echo "Success. Vi is installed."
    ;;
  "LazyVim")
    echo "Installing Neovim with LazyVim dotfiles..."
    sudo pacman -S --needed neovim --noconfirm
    echo "Success. Neovim is installed."
    echo "Installing LazyVim..."
    source $SCRIPTS/vim/install-lazyvim.sh
    ;;
  "AstroNvim")
    echo "Installing Neovim with AstroNvim dotfiles..."
    sudo pacman -S --needed neovim --noconfirm
    echo "Success. Neovim is installed."
    echo "Installing AstroNvim..."
    source $SCRIPTS/vim/install-astronvim.sh
    ;;
  "NvChad")
    echo "Installing Neovim with NvChad dotfiles..."
    sudo pacman -S --needed neovim --noconfirm
    echo "Success. Neovim is installed."
    echo "Installing NvChad..."
    source $SCRIPTS/vim/install-nvchad.sh
    ;;
  *)
    echo "Unknown selection: $nvim_distro"
    echo "Continuing "
    ;;
  esac
else
  echo "No selection made."
fi
