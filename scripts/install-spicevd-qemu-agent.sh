#!/bin/bash

# Install spice-vdagent and qemu-guest-agent
sudo pacman --needed -S spice-vdagent qemu-guest-agent --noconfirm

# Enable and start the services
sudo systemctl enable spice-vdagentd.service
sudo systemctl enable qemu-guest-agent.service
sudo systemctl start spice-vdagentd.service
sudo systemctl start qemu-guest-agent.service
