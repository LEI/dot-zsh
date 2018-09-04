#!/bin/zsh

SHELL="/bin/zsh"

reload() {
    exec $SHELL -l
}

# TODO: ~/.path

export ZSH_DIR=~/.zsh.d

# Load all configuration files but init.zsh
zsh_files=($ZSH_DIR/*.zsh)
for file in ${zsh_files:#*/init.zsh}; do
  source "$file"
done

# Load plugins files if the command corresponding to its name is available
for file in $ZSH_DIR/plugins/*.zsh; do
    hash ${file:t:r} 2>/dev/null && source $file
done

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Dynamic loading
#source <(antibody init)
#antibody bundle < ~/.zsh.d/plugins.txt

# Static loading of antibody plugins
source ~/.zsh_plugins.sh

[ -f ~/.zshrc.local ] && . ~/.zshrc.local
