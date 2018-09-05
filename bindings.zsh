#!/bin/zsh

# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/key-bindings.zsh

# Emacs mode is the default unless "vi" is found in EDITOR or VISUAL
bindkey -e # emacs mode

# bindkey -v # vi mode
# bindkey '\C-a' beginning-of-line
# bindkey '\C-e' end-of-line
#
# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Search backward incrementally, Use ^ to match the beginning of the line
bindkey '^r' history-incremental-search-backward

# bindkey '^[[A' up-line-or-search
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search

# bindkey '^[[B' down-line-or-search
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# autoload -U up-line-or-beginning-search
# autoload -U down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search

# Zle provides functionalities equivalent to ~/.inputrc
# https://github.com/zsh-users/zsh-history-substring-search

#bindkey "^[[A" history-beginning-search-backward
#bindkey "^[[B" history-beginning-search-forward

# autoload -U history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# bindkey "^[[A" history-beginning-search-backward-end
