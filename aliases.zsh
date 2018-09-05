#!/bin/zsh

# ZSH aliases

alias la="ls -la"
alias path='echo $PATH | tr -s ":" "\n"'

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

# Shortcuts
alias h="history"
alias hgrep="history | grep"
alias j="jobs"
alias l="ls -lF"
alias la="ls -lAF"

# Help command
autoload -Uz run-help
unalias run-help
alias help=run-help
