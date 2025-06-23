#!/bin/bash

# ------------------------------------------------
# Script for adding the BlackArch repos to vanilla Arch
#
# To see where this script came from, check:
# https://blackarch.org/downloads.html
# ------------------------------------------------

# SHA1 Checksum from the BlackArch website... be sure to double-check it...
checksum="bbf0a0b838aed0ec05fff2d375dd17591cbdf8aa"

# Run https://blackarch.org/strap.sh as root and follow the instructions.
curl -o scripts/blackarch/strap.sh https://blackarch.org/strap.sh

# Verify the SHA1 sum
echo $checksum scripts/blackarch/strap.sh | sha1sum -c

# Set execute bit
chmod +x scripts/blackarch/strap.sh

# Run strap.sh
sudo ./scripts/blackarch/strap.sh

# Enable multilib following https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib
sudo ./scripts/blackarch/enable_multilib.sh

# Update packages
sudo pacman -Syu
