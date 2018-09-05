#!/bin/zsh

# Enable command completion
autoload -Uz compinit
compinit

# Persistent rehash to automatically find new executables in PATH
#zstyle ':completion:*' rehash true

# Completion with an arrow-key driven interface
#zstyle ':completion:*' menu select

# Enable in privileged commands, be careful with untrusted scripts
#zstyle ':completion::complete:*' gain-privileges 1
