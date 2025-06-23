# THIS FILE WILL LIKELY BE OVERWRITTEN WHEN UPDATING THE DOTFILES.
# TO WORKAROUND THIS, YOU CAN CREATE A .bashrc_custom FILE IN YOUR HOME DIRECTORY.
# If it exists, .bashrc_custom will be loaded at the end of this file

# -----------------------------------------------------
# Aliases
# -----------------------------------------------------

# System
alias ls="ls --color=auto -lha"
alias grep="grep --color=auto"

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# -----------------------------------------------------
# Load .bashrc_custom (if exists)
# -----------------------------------------------------

if [ -f ~/.bashrc_custom ]; then
  source ~/.bashrc_custom
fi
