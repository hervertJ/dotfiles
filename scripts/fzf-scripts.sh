#!/usr/bin/env bash

cd "$HOME/scripts" || exit

while true; do
    sel=$(
        find . -mindepth 1 -maxdepth 1 -printf "%P\n" | sort |
        fzf --height 100% --layout reverse --style=minimal \
            --no-bold --info hidden \
            --pointer "> " --prompt "scripts> " \
            --color "current-bg:8,current-fg:-1,prompt:1,pointer:-1"
    ) || exit

    case "$sel" in
        *.sh)
            bash "$sel"
            ;;
        *.py)
            #nvim "$sel"
            python "$sel"
            ;;
        *)
            echo "Archivo no soportado: $sel"
            ;;
    esac
    exit
done
