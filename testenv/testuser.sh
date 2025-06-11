#!/bin/bash
set -euo pipefail

USERNAME="testuser"
HOME_DIR="/home/$USERNAME"

# Create user if it doesn't already exist
if ! id "$USERNAME" &>/dev/null; then
  useradd -m -s /bin/bash "$USERNAME"
  echo "[+] User '$USERNAME' created."
else
  echo "[*] User '$USERNAME' already exists."
fi

# Add user to wheel group for sudo access
usermod -aG wheel "$USERNAME"
echo "[+] User '$USERNAME' added to wheel group."

# Configure passwordless sudo for testuser
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$USERNAME"
chmod 440 "/etc/sudoers.d/$USERNAME"
echo "[+] Passwordless sudo configured for '$USERNAME'."

# Optionally copy dotfiles into the user's home
# cp -r ./dotfiles/. "$HOME_DIR"

# Set permissions
chown -R "$USERNAME:$USERNAME" "$HOME_DIR"

echo "[+] Setup complete for $USERNAME"