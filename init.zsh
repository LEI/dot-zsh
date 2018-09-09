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
if [[ -f ~/.sh_profile ]]; then
  source ~/.sh_profile
fi
# fpath=($fpath $HOME/bin)
# autoload -Uz load_path pathmunge
# if [[ -f ~/.path ]]; then
#   # source "$HOME"/bin/load_path ~/.path
#   load_path ~/.path
# fi

# Load all configuration files but init.zsh
typeset -U zsh_files
zsh_files=($ZSH/*.zsh)
for file in ${zsh_files:#*/init.zsh}; do
  source $file
done

# Load plugins files if the command corresponding to its name is available
for file in $ZSH/plugins/*.zsh; do
    hash ${file:r:t} 2>/dev/null && source $file
done

# Static loading of antibody plugins
# antibody bundle < bundles.conf > ~/.zsh.d/bundles.sh
source $ZSH/bundles.sh

[ -f ~/.zshrc.local ] && . ~/.zshrc.local
