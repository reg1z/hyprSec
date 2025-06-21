# THIS FILE WILL LIKELY BE OVERWRITTEN WHEN UPDATING THE DOTFILES.
# TO WORKAROUND THIS, YOU CAN CREATE A .zshrc_custom FILE IN YOUR HOME DIRECTORY.
# If it exists, .zshrc_custom will be loaded at the end of this file.


# History Settings
export HISTSIZE=10000
export SAVEHIST=10000
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
alias ls="ls -ha --color=auto"
alias grep='grep --color=auto'

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"

# -----------------------------------------------------
# Load .zshrc_custom (if exists)
# -----------------------------------------------------

if [ -f ~/.zshrc_custom ]; then
    source ~/.zshrc_custom
fi
