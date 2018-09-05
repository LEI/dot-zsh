#!/bin/zsh

# https://github.com/robbyrussell/oh-my-zsh/blob/master/oh-my-zsh.sh

SHELL="/bin/zsh"

reload() {
    exec $SHELL -l
}

# ZSH directory
export ZSH=~/.zsh.d

# Load all configuration files but init.zsh
# TODO: ~/.path first
zsh_files=($ZSH/*.zsh)
for file in ${zsh_files:#*/init.zsh}; do
  source "$file"
done

autoload -Uz "$ZSH"/functions/*(:r:t)
# for func in $ZSH/functions/*.zsh(:t); do
#     autoload -Uz $func
# done

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
