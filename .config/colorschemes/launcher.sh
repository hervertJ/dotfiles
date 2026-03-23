#!/bin/bash

opciones=" Theme\n Wallpapers\n Modes\n Utilities\n Fonts"

seleccion=$(echo -e "$opciones" | rofi -dmenu -theme $HOME/.config/rofi/launcher.rasi -p "Appareance")

case "$seleccion" in
    " Theme")
        ~/.config/colorschemes/apply-theme.sh
        ;;
    " Wallpapers")
        ~/scripts/wallpapers.sh
        ;;
    " Modes")
        notify-send "Que vas a estudiar hoy?"
        zen-browser https://www.youtube.com/playlist?list=PLff0yRu6mgBbwNygsHS72Ar044Bccjscz
        ;;
    " Utilities")
        notify-send "utilities prueba"
        ;;
    " Fonts")
        notify-send "fonts prueba"
        ;;
    *)
        exit 1
        ;;
esac
