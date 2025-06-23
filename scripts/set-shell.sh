#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

chosen_shell=$(gum choose "bash" "zsh" "fish" "xonsh" --header="Please select your preferred shell (default: bash):")

if [ -n "$chosen_shell" ]; then
  case $chosen_shell in
  bash)
    shell_path="/bin/bash"
    ;;
  zsh)
    sudo pacman -S --needed zsh --noconfirm
    shell_path="/usr/bin/zsh"
    ;;
  fish)
    sudo pacman -S --needed fish --noconfirm
    shell_path="/usr/bin/fish"
    ;;
  xonsh)
    sudo pacman -S --needed xonsh --noconfirm
    shell_path="/usr/bin/xonsh"
    ;;
  esac

  sudo chsh -s "$shell_path" "$CURRENT_USER"
  echo "Default shell set to $shell_path for user $CURRENT_USER. You may need to log out and log back in for changes to take effect."
else
  echo "No shell selected; no changes made."
fi
