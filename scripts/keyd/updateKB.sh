#!/bin/bash

sudo cp -i ./laptop_layout.conf /etc/keyd/laptop_layout.conf # place KB config into correct directory

repo=$(sha256sum ./laptop_layout.conf | awk '{print $1}')
target=$(sha256sum /etc/keyd/laptop_layout.conf | awk '{print $1}')

echo "Source Checksum: $repo"
echo "Target Checksum: $target"

if [ "$repo" == "$target" ]; then
  echo "Success! File integrity verified." && sudo keyd reload
  echo "Keyd reloaded."
else
  echo "Integrity check failed. Keyd daemon will not be reloaded."
fi
