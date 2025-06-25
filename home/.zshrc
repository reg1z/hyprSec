# THIS FILE WILL LIKELY BE OVERWRITTEN WHEN UPDATING THE DOTFILES.
# TO WORKAROUND THIS, YOU CAN CREATE A .zshrc_custom FILE IN YOUR HOME DIRECTORY.
# If it exists, .zshrc_custom will be loaded at the end of this file.


# History Settings
export HISTSIZE=500
export SAVEHIST=500
export HISTFILE=~/.zsh_history

# Misc Options
setopt appendhistory autocd extendedglob nomatch

# vi mode
export KEYTIMEOUT=1 # Make vi mode not laggy
bindkey -v
bindkey '^?' backward-delete-char   # make backspace work

# Prompt Theme
autoload -Uz promptinit && promptinit
prompt elite blue green

# Completion
autoload -Uz compinit && compinit


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
# Load .zshrc_custom (if exists)
# -----------------------------------------------------

if [ -f ~/.zshrc_custom ]; then
    source ~/.zshrc_custom
fi
