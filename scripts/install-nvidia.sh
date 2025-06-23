#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

set -euo pipefail

# Get the current running kernel
kernel_version="$(uname -r)"

# Display detected kernel version and recommend nvidia driver
cat <<EOM

!!! ---IMPORTANT:---
!!! Packages named with "open" are the open-source drivers. They are not recommended.
!!! Nvidia is in the process of transitioning primary support to the open drivers.
!!! The open drivers are still in active development and not yet considered stable.
!!! ----------------

DETECTED KERNEL VERSION: $kernel_version

- If using an LTS kernel (detected kernel_version ends in "-lts"), "nvidia-lts", "nvidia-dkms", "nvidia-open-lts", or "nvidia-open-dkms" is recommended.

- If using a non-LTS kernel, "nvidia", "nvidia-dkms", "nvidia-open", or "nvidia-open-dkms" is recommended.

- If you're unsure, "nvidia-dkms" or "nvidia-open-dkms" is recommended.

!!! Note that "nvidia-dkms" and "nvidia-open-dkms" will be re-built automatically on every kernel update.

EOM

# Ask if user wants to install nvidia drivers
choice=$(gum choose --header="Select the nvidia driver to install" "nvidia-dkms" "nvidia-lts" "nvidia" "nvidia-open-dkms" "nvidia-open-lts" "nvidia-open")

echo "Proceeding with NVIDIA driver installation using $choice"

sudo pacman -S --needed $choice --noconfirm
