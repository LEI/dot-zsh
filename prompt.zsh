#!/bin/zsh

# https://github.com/sindresorhus/pure

# PS1='%m%# '

# autoload -U promptinit; promptinit
# PURE_CMD_MAX_EXEC_TIME=10
# # PURE_PROMPT_SYMBOL...
# prompt pure

# autoload -Uz vcs_info
# # Enable only some version control systems
# zstyle ':vcs_info:*' enable git # cvs, hg, svn...
# zstyle ':vcs_info:*' formats 'on %u%c%b%f ' # '(%s)-[%b] '
# # '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
# zstyle ':vcs_info:*' actionformats 'on %u%c%b|%a%f ' # '(%s)-[%b|%a] '
# # '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
# # zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
# # patch-format, nopatch-format (%m), check-for-staged-changes
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' stagedstr '%F{2}xxx'
# zstyle ':vcs_info:*' unstagedstr '%F{1}'

print_user_host() {
  s=''
  # ${HOSTNAME##.*}
  if [[ $USER != $HOST ]]; then
    s='at '
    if [[ -n $SSH_TTY ]]; then
      s+='%F{1}'
    else
      s+='%F{6}'
    fi
    # %M  The full hostname
    # %m  The hostname up to the first dot
    s+='%M '
  fi
  echo $s
}

print_git_prompt() {
  # git rev-parse --show-toplevel
  s='on '
  if git diff --no-ext-diff --quiet --exit-code; then
    s+='%F{1}'
  else
    s+='%F{6}'
  fi
  s+='branch'
  s+='%f'
  echo $s
}

# prompt_pure_async_git_dirty
# fastest possible way to check if repo is dirty
git_dirty() {
  setopt localoptions noshwordsplit
  local untracked_dirty=$1

  if [[ $untracked_dirty = 0 ]]; then
    command git diff --no-ext-diff --quiet --exit-code
  else
    test -z "$(command git status --porcelain --ignore-submodules -unormal)"
  fi

  return $?
}

precmd () {
  prompt_user=$(print_user_host)

  # man zshcontrib
  prompt_git=$(print_git_prompt) # vcs_info

  # Red if the last status failed
  exit_status_color='%(?..%F{1})'

  # %# is equivalent to %(!.#.%%)
  prompt_symbol='%(!.#.›)'
}

PROMPT='%F{4}%n%f'
PROMPT+=' ${prompt_user}'
# PROMPT+=' '
# Working directory
PROMPT+='in %B%~%b' # %F{7}%3~%f
PROMPT+=' ${prompt_git}' # ${vcs_info_msg_0_}'
PROMPT+=$'\n'
# Working directory
PROMPT+='${exit_status_color}${prompt_symbol}%f '
