#!/bin/zsh

# ZSH aliases

# Help command
autoload -Uz run-help
unalias run-help
alias help=run-help

if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi

alias reloadrc="source ~/.zshrc"
