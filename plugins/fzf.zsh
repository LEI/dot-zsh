#!/bin/zsh

# for dir in {/usr/local/opt/fzf,~/.config/fzf,~/.fzf}; do
#   if [[ "$dir" == "$HOME/.fzf" ]] && [[ -d "$dir/bin" ]]; then
#     pathmunge "$dir/bin" after
#   fi
#   if [[ -d "$dir/shell" ]]; then
#     source "$dir/shell/key-bindings.zsh"
#     source "$dir/shell/completion.zsh"
#     break
#   fi
# done

if hash ag 2>/dev/null; then
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""' # --nocolor
else
  export FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD ||
    find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
        sed s/^..//) 2> /dev/null'
fi

export FZF_DEFAULT_OPTS='' # --height 40% --reverse --border
# --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
# --color info:108,prompt:109,spinner:108,pointer:168,marker:168

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
