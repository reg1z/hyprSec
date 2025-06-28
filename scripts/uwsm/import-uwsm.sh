#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

cp -f .config/uwsm/env $USER_HOME/.config/uwsm
cp -f .config/uwsm/env-hyprland $USER_HOME/.config/uwsm

if gum confirm --default=false "Are you using an Nvidia graphics card?\n\nAnswering yes will set Nvidia-optimized environment variables."; then
  cp -f .config/uwsm/env_nvidia $USER_HOME/.config/uwsm/env
fi
