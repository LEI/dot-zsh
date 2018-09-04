#!/bin/zsh

# https://github.com/sindresorhus/pure

# PS1='%m%# '

autoload -Uz vcs_info
# Enable only some version control systems
zstyle ':vcs_info:*' enable git # cvs, hg, svn...
zstyle ':vcs_info:*' formats 'on %u%c%b%f ' # '(%s)-[%b] '
# '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' actionformats 'on %u%c%b|%a%f ' # '(%s)-[%b|%a] '
# '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
# zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

# patch-format, nopatch-format (%m)

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{2}'
zstyle ':vcs_info:*' unstagedstr '%F{1}'

# check-for-staged-changes
# zstyle ':vcs_info:git:get-revision' true

precmd () {
  # man zshcontrib
  vcs_info

  # Red if the last status failed
  exit_status_color='%(?..%F{1})'

  # %# is equivalent to %(!.#.%%)
  prompt_symbol='%(!.#.›)'
}

# %M  The full hostname
# %m  The hostname up to the first dot
# %F{7}%3~%f
PS1='%F{4}%n%f in %B%~%b ${vcs_info_msg_0_}${exit_status_color}${prompt_symbol}%f '
