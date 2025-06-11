#!/bin/bash

echo "Starting container preparation..."

# Initialize pacman keyring properly for container environment
echo "Initializing pacman keyring..."
pacman-key --init
pacman-key --populate archlinux

# Update package databases and keyring
echo "Updating package databases..."
pacman -Sy --noconfirm

echo "Updating archlinux-keyring..."
pacman -S --noconfirm archlinux-keyring || {
    echo "Failed to update keyring, this may cause package installation issues"
}

echo "Upgrading system packages..."
pacman -Su --noconfirm || {
    echo "System upgrade failed, continuing with installation..."
}

# Install essential packages for GUI testing
echo "Installing essential packages..."
echo "Attempting to install: base-devel git sudo xorg-xhost mesa vulkan-intel wayland xwayland"

# Install packages one by one to identify which ones fail
packages=(
    "base-devel"
    "git" 
    "sudo"
    "xorg-xhost"
    "mesa"
    "vulkan-intel"
    "wayland"
    "xwayland"
)

for package in "${packages[@]}"; do
    echo "Installing $package..."
    if pacman -S --noconfirm --needed "$package"; then
        echo "✓ Successfully installed $package"
    else
        echo "✗ Failed to install $package"
    fi
done

# Create a non-root user for testing
echo "Creating testuser..."
if useradd -m -G wheel -s /bin/bash testuser 2>/dev/null; then
    echo "✓ Created testuser"
else
    echo "User testuser already exists, continuing..."
fi

echo "testuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "testuser:testuser" | chpasswd
echo "root:root" | chpasswd

# Prepare for Hyprland installation - fix path
echo "Setting up permissions..."
if chmod +x /home/testuser/hyprsec/install.sh; then
    echo "✓ Set execute permission on install.sh"
else
    echo "Warning: Could not set execute permission on install.sh"
fi

# Optional: Pre-configure some settings
mkdir -p /home/testuser/.config
chown -R testuser:testuser /home/testuser

echo ""
echo "=== Package Installation Summary ==="
echo "Checking which packages were successfully installed:"
for package in "${packages[@]}"; do
    if pacman -Q "$package" &>/dev/null; then
        echo "✓ $package is installed"
    else
        echo "✗ $package is NOT installed"
    fi
done

echo ""
echo "Container preparation completed!"
echo ""
echo "You can now:"
echo "1. Run the installation script with ./install.sh"
echo "2. Switch to testuser with 'su - testuser'"
echo "3. Start Hyprland with 'Hyprland'" 