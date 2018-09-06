#!/bin/zsh

# https://github.com/robbyrussell/oh-my-zsh/blob/master/oh-my-zsh.sh

# ZSH directory
export ZSH=~/.zsh.d

# fpath=($ZSH/functions $fpath)
#autoload -Uz $ZSH/functions/*(:r)
# for func in $ZSH/functions/*.zsh(:r:t); do
#   autoload -Uz $func
# done

# Global environment variables
if [[ -f ~/.exports ]]; then
  source ~/.exports
fi

# Append to PATH
path=($path $HOME/bin)
# fpath=($fpath $HOME/bin)
# autoload -Uz load_path pathmunge
if [[ -f ~/.path ]]; then
  load_path ~/.path
fi

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

# Dynamic loading
#source <(antibody init)
#antibody bundle < ~/.zsh.d/plugins.txt

# Static loading of antibody plugins
source ~/.zsh_plugins.sh

[ -f ~/.zshrc.local ] && . ~/.zshrc.local
