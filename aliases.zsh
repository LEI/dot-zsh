#!/bin/zsh

# ZSH aliases

aliad reload='source ~/.zshrc'
aliad reload!='exec "$SHELL" -l'

# More verbose
alias cp="cp -v"
alias ln="ln -v"
alias mv="mv -v"
alias rm="rm -v" # -i?

# More colors
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Always continue getting partially-downloaded file
alias wget="wget -c"

# Misc shortcuts
alias h="history"
alias hgrep="history | grep"
alias j="jobs"
alias l="ls -lF"
alias la="ls -lAF"
alias path='echo $PATH | tr -s ":" "\n"'

# Help command
autoload -Uz run-help
unalias run-help
alias help=run-help
