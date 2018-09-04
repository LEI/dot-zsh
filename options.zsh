#!/bin/zsh

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
