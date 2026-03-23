#!/bin/bash

opciones=" Theme\n Wallpapers\n Modes\n Utilities\n Fonts"

seleccion=$(echo -e "$opciones" | rofi -dmenu -theme $HOME/.config/rofi/launcher.rasi -p "Appareance")

case "$seleccion" in
    " Theme")
        ~/.config/colorschemes/apply-theme.sh
        ;;
    " Wallpapers")
        ~/.config/colorschemes/wallpapers.sh
        ;;
    " Modes")
        notify-send "pruebas modes"
        ;;
    " Utilities")
        ~/.config/colorschemes/utilities.sh
        ;;
    " Fonts")
        notify-send "fonts prueba"
        ;;
    *)
        exit 1
        ;;
esac
