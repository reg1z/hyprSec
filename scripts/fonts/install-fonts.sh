#!/bin/bash

SCRIPTS="scripts"
CURRENT_USER=$(whoami)
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")

defaultAppPackages=(
  "noto-fonts"
  "noto-fonts-emoji"
  "noto-fonts-cjk"
  "ttf-fira-sans"
  "ttf-fira-code"
  "ttf-firacode-nerd"
  "ttf-terminus-nerd"
)

# Install required packages
#sudo pacman -S --needed ${defaultAppPackages[@]}
sudo pacman -S --noconfirm --needed ttf-0xproto-nerd ttf-3270-nerd ttf-agave-nerd ttf-anonymouspro-nerd ttf-bigblueterminal-nerd ttf-proggyclean-nerd ttf-dejavu-nerd ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-daddytime-mono-nerd ttf-envycoder-nerd ttf-gohu-nerd ttf-go-nerd ttf-hack-nerd ttf-heavydata-nerd ttf-intone-nerd ttf-iosevkaterm-nerd ttf-iosevka-nerd ttf-iosevkatermslab-nerd ttf-mononoki-nerd ttf-profont-nerd ttf-ubuntu-nerd ttf-ubuntu-mono-nerd

sudo pacman -S --noconfirm --needed ${packages[@]}
