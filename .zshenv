typeset -U path
# https://wiki.archlinux.org/index.php/zsh#Startup.2FShutdown_files
#  /etc/profile overwrites the PATH variable,
#  set it from $ZDOTDIR/.zprofile instead of here
#path=(~/.local/bin /other/things/in/path $path[@])

PROMPT_LEAN_SYMBOL='%(!.#.›)'
PROMPT_LEAN_TMUX='' # used to indicate being in tmux, set to "t ", by default
PROMPT_LEAN_COLOR1='11' # jobs and VCS info indicator color
PROMPT_LEAN_COLOR2='12' # prompt character and directory color
PROMPT_LEAN_COLOR3='3' # elapsed time indicator color
# PROMPT_LEAN_VIMODE= # used to determine wether or not to display indicator
# PROMPT_LEAN_VIMODE_FORMAT= # Defaults to "%F{red}[NORMAL]%f"
PROMPT_LEAN_NOTITLE=1 # used to determine wether or not to set title
