#!/bin/bash

DIRS=(
    "$HOME"
    "$HOME/privrepo"
    "$HOME/privrepo/UNI"
    "$HOME/privrepo/Atlas/IA"
    "$HOME/pruebas"
    "$HOME/pruebas/bash"
    "$HOME/pruebas/C"
    "$HOME/pruebas/python"
    "$HOME/pruebas/lua"
    "$HOME/pruebas/rust"
    "$HOME/pruebas/typst"
    "$HOME/scripts"
)

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(fd . "${DIRS[@]}" --type=dir --max-depth=1 --full-path \
        | sed "s|^$HOME/||" \
        | fzf --height 100% --layout reverse --style=minimal --no-bold --info hidden --pointer "> " --prompt "sessions> " --color "current-bg:8,current-fg:-1,prompt:1,pointer:-1" )
    [[ $selected ]] && selected="$HOME/$selected"
fi

[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)
if ! tmux has-session -t "$selected_name"; then
    tmux new-session -ds "$selected_name" -c "$selected"
    tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t "$selected_name"
