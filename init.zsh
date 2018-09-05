#!/bin/zsh

# https://github.com/robbyrussell/oh-my-zsh/blob/master/oh-my-zsh.sh

# ZSH directory
export ZSH=~/.zsh.d

# fpath=($ZSH/functions $fpath)
autoload -Uz $ZSH/functions/*(:r)
# for func in $ZSH/functions/*.zsh(:r:t); do
#   autoload -Uz $func
# done

# Append to PATH
load_path ~/.path

# Load all configuration files but init.zsh
typeset -U zsh_files
zsh_files=($ZSH/*.zsh)
for file in ${zsh_files:#*/init.zsh}; do
  source "$file"
done

# Load plugins files if the command corresponding to its name is available
for file in $ZSH/plugins/*.zsh; do
    hash ${file:r:t} 2>/dev/null && source $file
done

# autoload -U up-line-or-beginning-search
# autoload -U down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search

# Zle provides functionalities equivalent to ~/.inputrc
# https://github.com/zsh-users/zsh-history-substring-search
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
# autoload -U history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# bindkey "^[[A" history-beginning-search-backward-end

# Dynamic loading
#source <(antibody init)
#antibody bundle < ~/.zsh.d/plugins.txt

# Static loading of antibody plugins
source ~/.zsh_plugins.sh

[ -f ~/.zshrc.local ] && . ~/.zshrc.local
