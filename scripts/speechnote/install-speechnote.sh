#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

# Ask user to install flatpak if they haven't already.
#echo "This script only supports installation of the flatpak version of speechnote. You must have flatpak. If you haven't installed it beforehand, would you like to do so now?"
sudo pacman -S flatpak --needed --noconfirm

flatpak install net.mkiol.SpeechNote

# Ask if user would like to install the AMD or NVIDIA GPU speechnote addons.

#flatpak install net.mkiol.SpeechNote.Addon.nvidia
#flatpak install net.mkiol.SpeechNote.Addon.amd

sudo pacman -S --needed ydotool # ydotool is required for global keyboard shortcuts with Wayland

# Import updated ydotoold.service systemd unit into systemd
mkdir -p $USER_HOME/.config/systemd
mkdir -p $USER_HOME/.config/systemd/user
sudo cp -f $SCRIPTS/speechnote/ydotool.service $USER_HOME/.config/systemd/user/ydotool.service

#sudo cp -f $SCRIPTS/speechnote/ydotool.service /usr/lib/systemd/user/ydotool.service
#sudo chown root:root /usr/lib/systemd/user/ydotool.service

# Create new socket location for more precise/secure flatpak permissions
mkdir -p /run/user/$(id $CURRENT_USER -u)/ydotoold

# Import speechnote.service systemd unit into user's systemd config
cp -f $SCRIPTS/speechnote/speechnote.service $USER_HOME/.config/systemd/user/speechnote.service

systemctl --user daemon-reexec

# enable imported systemd services
systemctl --user enable ydotool.service
systemctl --user enable speechnote.service

# Give the speechnote flatpak permissions to access the ydotoold socket
flatpak override --user --filesystem=/run/user/1000/ydotoold/.ydotoold_socket:rw net.mkiol.SpeechNote
