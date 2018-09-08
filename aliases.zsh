#!/bin/zsh

# ZSH aliases

alias reload='source ~/.zshrc'
alias reload!='exec "$SHELL" -l'

if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi

# Help command
autoload -Uz run-help
unalias run-help
alias help=run-help
