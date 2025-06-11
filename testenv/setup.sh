#!/bin/bash

echo "=========================================="
echo "  Hyprsec Docker Container Setup"
echo "=========================================="
echo ""
echo "This will prepare the container for Hyprland testing."
echo "Press Enter to continue or Ctrl+C to cancel..."
read -r

# Run the preparation script
chmod +x /home/testuser/hyprsec/dockercompose/prepare-hyprland-test.sh
/home/testuser/hyprsec/dockercompose/prepare-hyprland-test.sh

echo ""
echo "=========================================="
echo "  Setup Complete!"
echo "=========================================="
echo ""
echo "You can now:"
echo "• Switch to testuser: su - testuser"
echo "• Run the hyprsec installer: ./install.sh"
echo "• Or continue as root for debugging"
echo "" 