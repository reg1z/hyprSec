#!/bin/bash

# Exit on error
#set -e

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

# **************************************************************
# DEFAULT PACKAGES AND SETUP
#
# **************************************************************

# List of packages to install
packages=(
  "gum"        # cli tool for shell scripts
  "uwsm"       # universal wayland session manager
  "base-devel" # basic development tools
  "git"        # version control system
  "networkmanager"
  "network-manager-applet"
  "firewalld"             # firewall
  "blueman"               # bluetooth manager
  "openssh"               # ssh
  "upower"                # power metrics
  "power-profiles-daemon" # power management
  "hyprland"
  "hyprpaper"
  "hypridle"
  "hyprlock"
  "xdg-desktop-portal-hyprland"
  "hyprland-qt-support"
  "hyprcursor"
  "hyprpolkitagent" # polkit agent
  "wl-clipboard"
  "cliphist"
  "waybar"
  "rofi-wayland" # application launcher
  "mako"         # notification daemon
  "keyd"
  "pipewire"
  "wireplumber"
  "playerctl" # media player controller
  "qt5-wayland"
  "qt6-wayland"
  "grim"              # screenshot utility
  "slurp"             # region selection utility (for grim)
  "loupe"             # image viewer
  "thunar"            # file manager
  "gvfs"              # file system support for thunar
  "tmux"              # terminal multiplexer
  "kitty"             # terminal emulator
  "firefox"           # web browser
  "vlc"               # media player
  "ttf-fira-sans"     # font
  "ttf-fira-code"     # font
  "ttf-firacode-nerd" # font
  "ttf-terminus-nerd" # font
)

# Create necessary directories
mkdir -p $USER_HOME/.config
mkdir -p $USER_HOME/.config/hypr # cfg directory for hyprland ecosystem
mkdir -p $USER_HOME/.config/waybar
mkdir -p $USER_HOME/.config/rofi
mkdir -p $USER_HOME/.config/mako

# Install required packages
sudo pacman -S --needed ${packages[@]}

# **************************************************************
# USER CHOICES
#
# **************************************************************

# Ask if user wants to backup their dotfiles
if gum confirm --default=false "Do you want to backup your dotfiles?"; then
  source ./$SCRIPTS/backup-dotfiles.sh
fi

# Ask if user wants to delete certain contents of ~/.config
# TODO: Move these lines to each of the scripts/prompts/conditionals they're associated with. If the user isn't installing everything, they could bescrewed over by this rm block
if gum confirm --default=false "Do you want to delete the relevant files in ~/.config? If you're at all concerned, just ensure you've backed up your .config folder."; then
  rm -rf $USER_HOME/.config/hypr
  rm -rf $USER_HOME/.config/waybar
  rm -rf $USER_HOME/.config/rofi
  rm -rf $USER_HOME/.config/mako
  rm -rf $USER_HOME/.config/kitty
fi

# --------------------------------------------------------------
# Nvidia Drivers
# --------------------------------------------------------------

# Ask if user if they have an Nvidia GPU
if gum confirm --default=false "Are you using Nvidia hardware and want to install the necessary drivers?"; then
  source $SCRIPTS/install-nvidia.sh
fi

# --------------------------------------------------------------
# AUR Helper
# --------------------------------------------------------------

# Ask if user wants to install AUR helper (yay) using gum with a default of no
if gum confirm --default=false "Do you want to install an AUR helper (yay/paru)?"; then
  source $SCRIPTS/install-aur-helper.sh
fi

# --------------------------------------------------------------
# Keyboard
# --------------------------------------------------------------

# Explain keyd
cat <<EOM

keyd is a keyboard daemon that allows you to remap your keyboard keys.
Included is a default configuration that implements the Enthium layout
+ homerow mods for thinkpad keyboards.

If you're unfamiliar with keyd, you will want to skip this.

EOM

# Ask if user wants to install qemu-desktop with virt-manager for the frontend
if gum confirm --default=false "Do you want to install qemu-desktop and virt-manager, a popular frontend for managing virtual machines?"; then
  source $SCRIPTS/install-qemu.sh
fi

# Ask if user wants to install neovim
if gum confirm --default=false "Do you want to install neovim?"; then
  source $SCRIPTS/install-nvim.sh
fi

# Ask if user wants to install sddm
if gum confirm --default=false "Do you want to install sddm as your display manager? If not, you'll just have the default tty shell at login."; then
  source $SCRIPTS/install-sddm.sh
fi

# Ask if user wants to install keyd using gum with a default of no
if gum confirm --default=false "Do you want to install keyd and the Enthium layout? (only recommended for keyboard enthusiasts)"; then
  source $SCRIPTS/keyd/install-keyd.sh
fi

# Ask if user wants to install qemu-desktop with virt-manager for the frontend
if gum confirm --default=false "Do you want to install a terminal multiplexer such as tmux or zellij? Note that installing tmux with this script will currently set you up with my personal tmux configuration."; then
  source $SCRIPTS/install-tmux.sh
fi

# Import configuration files and assets
source $SCRIPTS/import-configs.sh

# enable services
sudo systemctl --quiet enable --now NetworkManager
sudo systemctl --quiet enable --now firewalld
sudo systemctl --quiet enable --now power-profiles-daemon

echo "Installation complete! Please log out and log back in to start using Hyprland."
