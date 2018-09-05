#!/bin/zsh

# autoload -Uz promptinit
# promptinit
# prompt <theme>

# PS1='%m%# '

# autoload -Uz vcs_info
# Enable only some version control systems
# zstyle ':vcs_info:*' enable git # cvs, hg, svn...
# zstyle ':vcs_info:*' formats 'on %u%c%b%f ' # '(%s)-[%b] '
# # '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
# zstyle ':vcs_info:*' actionformats 'on %u%c%b|%a%f ' # '(%s)-[%b|%a] '
# # '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
# # zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
# # patch-format, nopatch-format (%m), check-for-staged-changes

# PROMPT_LEAN_LEFT: executed to allow custom information in the left side
# PROMPT_LEAN_RIGHT: executed to allow custom information in the right side

# PROMPT='%F{4}%n%f'
# PROMPT+=' ${prompt_user}'
# # PROMPT+=' '
# # Working directory
# PROMPT+='in %B%~%b' # %F{7}%3~%f
# PROMPT+=' ${prompt_git}' # ${vcs_info_msg_0_}'
# PROMPT+=$'\n'
# # Working directory
# PROMPT+='${exit_status_color}${prompt_symbol}%f '

# https://wiki.archlinux.org/index.php/zsh#xterm_title
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
  print -Pn '\e]2;%n@%m %1~\a'
}

function xterm_title_preexec () {
  print -Pn '\e]2;%n@%m %1~ %# '
  print -n "${(q)1}\a"
}

if [[ "$TERM" == (screen*|xterm*|rxvt*) ]]; then
  add-zsh-hook -Uz precmd xterm_title_precmd
  add-zsh-hook -Uz preexec xterm_title_preexec
fi
