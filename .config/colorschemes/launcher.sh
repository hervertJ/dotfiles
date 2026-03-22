#!/bin/bash

opciones=" Theme\n Wallpapers\n Waybar\n Modes\n Fonts"

seleccion=$(echo -e "$opciones" | rofi -dmenu -theme $HOME/.config/rofi/launcher.rasi -p "Appareance")

case "$seleccion" in
    " Theme")
        ~/.config/colorschemes/apply-theme.sh
        ;;
    " Wallpapers")
        ~/scripts/wallpapers.sh
        ;;
    " Waybar")
        ;;
    " Modes")
        notify-send "Que vas a estudiar hoy?"
        zen-browser https://www.youtube.com/playlist?list=PLff0yRu6mgBbwNygsHS72Ar044Bccjscz
        ;;
    " Fonts")
        ;;
    *)
        exit 1
        ;;
esac
