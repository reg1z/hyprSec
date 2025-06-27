#!/bin/bash

SCRIPTS="scripts"
USER_HOME=$(eval echo "~${SUDO_USER:-$USER}")
CURRENT_USER=$(whoami)

BACKUPS=$USER_HOME/Backups

# backup function
backupNvim() {
  local timestamp=$(date +"%y-%m-%d_%H-%M-%S")
  local backupdir=$BACKUPS/nvim_backup_"$timestamp"

  mkdir -p $BACKUPS
  mkdir -p $backupdir
  mkdir -p $backupdir/.config
  mkdir -p $backupdir/.local
  mkdir -p $backupdir/.cache

  cp -r $USER_HOME/.config/nvim $backupdir/.config
  cp -r $USER_HOME/.local/share/nvim $backupdir/.local/share
  cp -r $USER_HOME/.local/state/nvim $backupdir/.local/state
  cp -r $USER_HOME/.cache/nvim $backupdir/.cache

  echo "Nvim config (including .cache, .local/share, and .local/state folders) backed up to $backup_dir."

  return 0
}

choice=$(gum choose "No. (I have no config right now, or just don't care)." "Yes. Back me up." --header="Would you like to backup your existing nvim configuration?")
if [ -n "$choice" ]; then
  case "$choice" in
  "No. (I have no config right now, or just don't care).")
    echo "OK. Continuing without a backup."
    :
    ;;
  "Yes. Back me up.")
    backupNvim
    ;;
  esac
else
  echo "Nothing selected. Performing a backup of nvim environment just in case..."
  backupNvim
fi
