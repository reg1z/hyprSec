# THIS FILE WILL LIKELY BE OVERWRITTEN WHEN UPDATING THE DOTFILES.
# TO WORKAROUND THIS, YOU CAN CREATE A .bashrc_custom FILE IN YOUR HOME DIRECTORY.
# If it exists, .bashrc_custom will be loaded at the end of this file

# -----------------------------------------------------
# Aliases
# -----------------------------------------------------

# Colorize some standard commands
alias ls="ls --color=auto -ha"
alias grep="grep --color=auto"
alias pacman="pacman --color=auto"
alias yay="yay --color=auto"
alias paru="paru --color=auto"
alias diff="diff --color=auto"
alias ip="ip --color=auto"

# Git short-hands
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# GhostScript replacement alias for "gs"
alias gscrpt="exec /usr/bin/gs"

# -----------------------------------------------------
# Load .bashrc_custom (if exists)
# -----------------------------------------------------

if [ -f ~/.bashrc_custom ]; then
  source ~/.bashrc_custom
fi
