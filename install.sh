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
  "xdg-desktop-portal"
  "xdg-desktop-portal-gtk"
  "xdg-desktop-portal-hyprland"
  "hyprland-qt-support"
  "hyprcursor"
  "hyprpolkitagent" # polkit agent
  "wl-clipboard"
  "cliphist"
  "waybar"
  "rofi-wayland" # application launcher
  "mako"         # notification daemon
  "pipewire"
  "wireplumber"
  "playerctl"         # media player controller
  "grim"              # screenshot utility
  "slurp"             # region selection utility (for grim)
  "tmux"              # terminal multiplexer
  "kitty"             # terminal emulator
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
source ./$SCRIPTS/setup-qt.sh
#source ./$SCRIPTS/install-default-apps.sh
#source ./$SCRIPTS/suite_kde/install-kde-apps.sh
source ./$SCRIPTS/suite_xfce/install-xfce-apps.sh

# ASCII art
gum style --foreground="#E23737" --bold <<EOM
Welcome to...
 _                      ____            
| |__  _   _ _ __  _ __/ ___|  ___  ___ 
| '_ \| | | | '_ \| '__\___ \ / _ \/ __|
| | | | |_| | |_) | |   ___) |  __/ (__ 
|_| |_|\__, | .__/|_|  |____/ \___|\___|
       |___/|_|    
EOM

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
  rm -rf $USER_HOME/.config/uwsm
  rm -rf $USER_HOME/.config/Kvantum
  rm -rf $USER_HOME/.config/qt6ct
  rm -rf $USER_HOME/.config/qt5ct
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
# Virtualization
# --------------------------------------------------------------

# Ask if user wants to install qemu-desktop with virt-manager for the frontend
if gum confirm --default=false "Do you want to install qemu and virt-manager, a popular frontend for managing virtual machines?"; then
  source $SCRIPTS/install-qemu.sh
fi

# Ask if user wants to install docker from the official docker repositories
# ...

# --------------------------------------------------------------
# vim
# --------------------------------------------------------------

# Ask if user wants to install neovim
if gum confirm --default=false "Do you want to install Vim, Neovim, or Vi?"; then
  source $SCRIPTS/vim/install-vim.sh
fi

# --------------------------------------------------------------
# Display Manager
# --------------------------------------------------------------

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

# Ask if user wants to install keyd
if gum confirm --default=false "Do you want to install keyd and the Enthium layout? (only recommended for keyboard enthusiasts)"; then
  source $SCRIPTS/keyd/install-keyd.sh
fi

# Ask if user wants to install tmux
if gum confirm --default=false "Do you want to install tmux? Note that installing tmux with this script will currently set you up with a non-default tmux configuration."; then
  source $SCRIPTS/install-tmux.sh
fi

# Explain BlackArch
cat <<EOM

BlackArch is an Arch-based Linux distribution intended
for penetration testers and cybersecurity enthusiasts.

Answering "YES" will:
    - Enable access to the BlackArch repositories via pacman.
    - Install standard packages and security tools included in BlackArch.
    - It will NOT change any pre-existing desktop configurations.

(!) Only do this if you know what you're doing.

EOM

# Ask if user wants to install the BlackArch Pentisting Distribution Repositories
if gum confirm --default=false "Do you want to install BlackArch?"; then
  source $SCRIPTS/blackarch/install-blackarch.sh
fi

# Explain spice-vdagent and qemu-guest-agent
cat <<EOM

spice-vdagent and qemu-guest-agent are services intended for
guest virtual machines. They are required for certain features
in QEMU/SPICE, such as clipboard sharing, automatic desktop resizing, and more.

(!) Only do this if you're sure you're in a virtual machine.

EOM
# Ask if user wants to install spice-vdagent and qemu-guest-agent
if gum confirm --default=false "Is your Arch installation in a virtual machine? If so, do you want to install and enable spice-vdagent and qemu-guest-agent?"; then
  source $SCRIPTS/install-spicevd-qemu-agent.sh
fi

# Ask if user wants to install sddm
if gum confirm --default=false "Do you want to install sddm as your display manager? If not, you'll just have the default tty shell at login."; then
  source $SCRIPTS/sddm/install-sddm.sh
fi

# Ask for the user's $SHELL of choice
source $SCRIPTS/set-shell.sh

if gum confirm --default=false "Would you like to install flatpak? This is required for installing applications from flathub."; then
  source $SCRIPTS/install-flatpak.sh
fi

if gum confirm --default=false "Would you like to install speechnote, a locally hosted Speech-to-Text and Text-to-Speech application? Flatpak is required and will be installed if you select yes."; then
  source $SCRIPTS/speechnote/install-speechnote.sh
fi

# Ask for the user's $SHELL of choice
if gum confirm --default=false 'Would you like to install the i3 tiling window manager? (stable X11 hyprland alternative/backup environment)'; then
  source $SCRIPTS/i3/install-i3.sh
fi

# Import configuration files and assets
source $SCRIPTS/import-configs.sh

# enable services
sudo systemctl --quiet enable --now NetworkManager
sudo systemctl --quiet enable --now firewalld
sudo systemctl --quiet enable --now power-profiles-daemon

echo "Installation complete! A reboot is recommended. You can now launch Hyprland."
