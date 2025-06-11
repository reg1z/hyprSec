#!/bin/bash

sudo pacman -S --needed keyd                        # install keyd if not present already
sudo cp -i ./laptop_layout.conf /etc/keyd/laptop_layout.conf # place KB config into correct directory
sudo systemctl --quiet enable --now keyd
