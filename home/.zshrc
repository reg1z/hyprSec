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
bindkey -v

# Prompt Theme
autoload -Uz promptinit && promptinit
prompt adam2

# Completion
autoload -Uz compinit && compinit


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
# Load .zshrc_custom (if exists)
# -----------------------------------------------------

if [ -f ~/.zshrc_custom ]; then
    source ~/.zshrc_custom
fi
