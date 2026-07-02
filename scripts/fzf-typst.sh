#!/usr/bin/env bash

DEFAULT_DIR="$HOME/privrepo"
start="${1:-.}"

cd "$start" || exit

if [ -z "$(fd --type f --extension typ --max-results 1)" ]; then
    cd "$DEFAULT_DIR" || exit
fi

sel=$(
    fd --type f --extension typ | sort |
    fzf --height 100% --layout reverse --style=minimal --no-bold --info hidden --pointer "> " --prompt "PDFs> " --color "current-bg:8,current-fg:-1,prompt:1,pointer:-1"
) || exit

nvim +TypstPreview "$sel"
