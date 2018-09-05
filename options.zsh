#!/bin/zsh

# https://github.com/caarlos0/dotfiles/blob/master/zsh/config.zsh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# adds history
setopt APPEND_HISTORY
# adds history incrementally and share it across sessions
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
# don't record dupes in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY

# https://github.com/willghatch/zsh-saneopt/blob/master/saneopt.plugin.zsh

# No c-s/c-q output freezing
setopt noflowcontrol
# Allow expansion in prompts (PROMP_SUBST)
setopt prompt_subst
# This is default, but set for share_history
setopt append_history
# Save each command's beginning timestamp and the duration to the history file
setopt extended_history
# Display PID when suspending processes as well
setopt longlistjobs
# Try to avoid the 'zsh: no matches found...'
setopt nonomatch
# Report the status of backgrounds jobs immediately
setopt notify
