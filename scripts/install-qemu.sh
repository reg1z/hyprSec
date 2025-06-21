#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

# Arch Linux QEMU + Virt-Manager Installation Script
# Part of HyprSec Dotfiles Project
# Follows secure-by-default principles

set -euo pipefail

# Ensure script is run with sudo/root privileges
#if [[ $EUID -ne 0 ]]; then
#   echo "Error: This script must be run with sudo or as root" >&2
#   exit 1
#fi

# Confirm installation
if ! gum confirm "This will install QEMU and virt-manager. Proceed?"; then
  echo "Installation cancelled by user"
  exit 1
fi

# Update package database
gum spin --spinner dot --title "Updating package database..." -- \
  sudo pacman -Sy --noconfirm || {
  echo "Failed to update package database" >&2
  exit 1
}

# Install core virtualization packages
echo 'Installing core virtualization packages...'
sudo pacman -S \
  qemu-full \
  libvirt \
  virt-manager \
  virt-viewer \
  dnsmasq \
  openbsd-netcat \
  iptables-nft ||
  {
    echo "Failed to install virtualization packages" >&2
    exit 1
  }

# Optional: Install additional recommended packages
if gum confirm "Install additional recommended virtualization tools?"; then
  gum spin --spinner dot --title "Installing additional tools..." -- \
    sudo pacman -S --noconfirm \
    edk2-ovmf \
    bridge-utils ||
    echo "Some optional packages could not be installed" >&2
fi

# Enable and start libvirtd service
gum spin --spinner dot --title "Enabling libvirtd service..." -- \
  sudo systemctl enable libvirtd.service || echo "Could not enable libvirtd service" >&2

gum spin --spinner dot --title "Starting libvirtd service..." -- \
  sudo systemctl start libvirtd.service || echo "Could not start libvirtd service" >&2

# Configure user group for libvirt access
username=$(gum input --placeholder "Enter username to add to libvirt group")
if [[ -n "$username" ]]; then
  gum spin --spinner dot --title "Adding user to libvirt group..." -- \
    sudo usermod -aG libvirt "$username" || echo "Could not add user to libvirt group" >&2
fi

# Security: Restrict libvirt socket permissions
gum spin --spinner dot --title "Configuring libvirt socket permissions..." -- \
  sudo bash -c '
    sed -i "s/^#unix_sock_group = \"libvirt\"/unix_sock_group = \"libvirt\"/" /etc/libvirt/libvirtd.conf
    sed -i "s/^#unix_sock_rw_perms = \"0770\"/unix_sock_rw_perms = \"0770\"/" /etc/libvirt/libvirtd.conf
    '

# Restart libvirtd to apply permission changes
gum spin --spinner dot --title "Restarting libvirtd service..." -- \
  sudo systemctl restart libvirtd.service || echo "Could not restart libvirtd service" >&2

# Enable NAT connectivity for default network
if gum confirm "Would you like to enable NAT connectivity for the default libvirt network?"; then
  gum spin --spinner dot --title "Configuring default network for NAT..." -- \
    sudo bash -c '
        # Set firewall backend to iptables
        echo "firewall_backend = \"iptables\"" > /etc/libvirt/network.conf

        # Ensure the default network is defined
        virsh net-list --all | grep -q "default" || virsh net-create /etc/libvirt/qemu/networks/default.xml

        # Enable the network if it is not already active
        virsh net-list | grep -q "default.*active" || virsh net-start default

        # Ensure the network autostart is enabled
        virsh net-autostart default
        '
fi

echo "QEMU and virt-manager installation completed successfully!"

# Provide post-installation guidance
gum format -- "
# Post-Installation Notes
- Ensure your user is in the 'libvirt' group
- Use 'virt-manager' to manage virtual machines
- Refer to Arch Wiki for advanced virtualization configurations

"
