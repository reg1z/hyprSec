#!/bin/bash

mkdir -p ~/.config/nvim

# Clone the LazyVim starter configuration
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Headlessly install the LazyVim plugins
nvim --headless "+Lazy! sync" +qa

# Headlessly run :LazyHealth
nvim --headless "+LazyHealth" "+qa"
