#!/bin/bash
set -euo pipefail

USERNAME="testuser"

# Check if user exists
if ! id "$USERNAME" &>/dev/null; then
  echo "[*] User '$USERNAME' does not exist."
  exit 0
fi

# Remove sudo configuration
if [ -f "/etc/sudoers.d/$USERNAME" ]; then
  rm "/etc/sudoers.d/$USERNAME"
  echo "[+] Removed sudo configuration for '$USERNAME'."
fi

# Remove user from wheel group (if they're in it)
if groups "$USERNAME" | grep -q wheel; then
  gpasswd -d "$USERNAME" wheel
  echo "[+] Removed '$USERNAME' from wheel group."
fi

# Remove user and their home directory
userdel -r "$USERNAME" 2>/dev/null || {
  echo "[!] Failed to remove home directory, removing user only..."
  userdel "$USERNAME"
}

echo "[+] User '$USERNAME' removed successfully." 