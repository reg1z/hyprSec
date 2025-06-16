#!/bin/bash

# Exit on error
set -e

# **************************************************************
# DEFAULT PACKAGES AND SETUP
#
# **************************************************************

# List of packages to install
packages=(
    "gum"                       # cli tool for shell scripts
    "uwsm"                      # universal wayland session manager
    "base-devel"                # basic development tools
    "git"                       # version control system
    "networkmanager"
    "network-manager-applet"
    "firewalld"                 # firewall
    "blueman"                   # bluetooth manager
    "openssh"                   # ssh
    "upower"                    # power metrics
    "power-profiles-daemon"     # power management
    "hyprland"
    "hyprpaper"
    "hypridle"
    "hyprlock"
    "xdg-desktop-portal-hyprland"
    "hyprland-qt-support"
    "hyprcursor"
    "hyprpolkitagent"           # polkit agent
    "wl-clipboard"
    "cliphist"
    "waybar"
    "rofi-wayland"              # application launcher
    "mako"                      # notification daemon
    "keyd"
    "pipewire"
    "wireplumber"
    "playerctl"                 # media player controller
    "qt5-wayland"
    "qt6-wayland"
    "grim"                      # screenshot utility
    "slurp"                     # region selection utility (for grim)
    "loupe"                     # image viewer
    "thunar"                    # file manager
    "gvfs"                      # file system support for thunar
    "neovim"                    # text editor
    "tmux"                      # terminal multiplexer
    "kitty"                     # terminal emulator
    "firefox"                   # web browser
    "vlc"                       # media player
    "ttf-fira-sans"             # font
    "ttf-fira-code"             # font
    "ttf-firacode-nerd"         # font
    "ttf-terminus-nerd"         # font
)

# Create necessary directories
mkdir -p ~/.config
mkdir -p ~/.config/hypr         # cfg directory for hyprland ecosystem
mkdir -p ~/.config/waybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/mako

# Install required packages
sudo pacman -S --needed ${packages[@]}



# **************************************************************
# USER CHOICES
#
# **************************************************************


# --------------------------------------------------------------
# Nvidia Drivers
# --------------------------------------------------------------

# Ask if user if they have an Nvidia GPU
if gum confirm --default=false "Are you using Nvidia hardware and want to install the necessary drivers?"; then
    source scripts/install-nvidia.sh
fi


# --------------------------------------------------------------
# AUR Helper
# --------------------------------------------------------------

# Ask if user wants to install AUR helper (yay) using gum with a default of no 
if gum confirm --default=false "Do you want to install an AUR helper (yay/paru)?"; then
    source scripts/install-aur-helper.sh
fi


# --------------------------------------------------------------
# Keyboard
# --------------------------------------------------------------

# Explain keyd
cat << EOM

keyd is a keyboard daemon that allows you to remap your keyboard keys.
Included is a default configuration that implements the Enthium layout
+ homerow mods for thinkpad keyboards.

If you're unfamiliar with keyd, you will want to skip this.

EOM

# Ask if user wants to install qemu-desktop with virt-manager for the frontend
if gum confirm --default=false "Do you want to install qemu-desktop and virt-manager, a popular frontend for managing virtual machines?"; then
    source ./scripts/install-qemu.sh
fi

# Ask if user wants to install lazyvim
if gum confirm --default=false "Do you want to install LazyVim as your Neovim configuration? Config files will be sourced from the Github repo."; then
    source ./scripts/install-lazyvim.sh
fi


# Ask if user wants to install keyd using gum with a default of no
if gum confirm --default=false "Do you want to install keyd and the Enthium layout? (only recommended for keyboard enthusiasts)"; then
    source ./scripts/keyd/install-keyd.sh
fi

# Ask if user wants to install qemu-desktop with virt-manager for the frontend
if gum confirm --default=false "Do you want to install a terminal multiplexer such as tmux or zellij? Note that installing tmux with this script will currently set you up with my personal tmux configuration."; then
    source ./scripts/install-tmux.sh
fi

# Ask if user wants to backup their dotfiles
if gum confirm --default=false "Do you want to backup your dotfiles?"; then
    source ./scripts/backup-dotfiles.sh
fi

# Ask if user wants to delete the contents of ~/.config
if gum confirm --default=false "Do you want to delete the relevant files in ~/.config?"; then
    rm -rf ~/.config/hypr
    rm -rf ~/.config/waybar
    rm -rf ~/.config/rofi
    rm -rf ~/.config/mako
fi

# Import configuration files and assets
source ./scripts/import-configs.sh

# enable services
sudo systemctl --quiet enable --now NetworkManager
sudo systemctl --quiet enable --now firewalld
sudo systemctl --quiet enable --now power-profiles-daemon

echo "Installation complete! Please log out and log back in to start using Hyprland." 