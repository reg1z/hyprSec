#!/bin/bash

# Create a directory for cloned aur package repos.
mkdir -p $USER_HOME/aur
cd /home/$USER_HOME/aur

# Provide user with a choice of AUR helpers: yay or paru.
# If they pick yay -> install yay, else install paru.

aur_helper=$(gum choose --header="Select your preferred AUR helper. To skip, press [ENTER]:" "yay" "paru")

if [ "$aur_helper" == "yay" ]; then
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
  rm -rf yay
elif [ "$aur_helper" == "paru" ]; then
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
  cd ..
  rm -rf paru
else
  cat <<EOM

    Invalid selection. Defaulting to no AUR helper.

    You can install an AUR helper later by running: \`install-aur-helper.sh\`
    from this project's /scripts directory.

    Continuing where we left off...
EOM
  exit 1
fi
