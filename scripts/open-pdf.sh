#!/bin/bash

SIOYEK_BIN="$HOME/Apps/Sioyek-x86_64.AppImage"
DEFAULT_DIR="$HOME/privrepo"
start="${1:-.}"

cd "$start" || exit

if [ -z "$(fd --type f --extension pdf --max-results 1)" ]; then
    cd "$DEFAULT_DIR" || exit
fi

sel=$(
    fd --type f --extension pdf | sort |
    fzf --height 100% --layout reverse --style=minimal --no-bold --info hidden --pointer "> " --prompt "PDFs> " --color "current-bg:8,current-fg:-1,prompt:1,pointer:-1"
) || exit

#xdg-open "$sel" > /dev/null 2>&1 &
#disown
setsid -f "$SIOYEK_BIN" "$sel" > /dev/null 2>&1
