#!/bin/zsh

if hash nvim 2>/dev/null; then
  EDITOR="nvim"
else
  EDITOR="vim"
fi

export $EDITOR
export VISUAL="$EDITOR"
