#!/bin/zsh

# ZSH aliases

if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi

alias reload='source ~/.zshrc'
alias reload!='exec "$SHELL" -l'

# Help command
autoload -Uz run-help
unalias run-help
alias help=run-help
