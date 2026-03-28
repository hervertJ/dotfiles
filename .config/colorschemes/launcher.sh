#!/bin/bash

opciones=" Theme\n Wallpapers\n Modes\n Utilities\n Fonts"
#opciones="Theme\nWallpapers\nModes\nUtilities\nFonts"

seleccion=$(echo -e "$opciones" | rofi -dmenu -theme $HOME/.config/rofi/launcher.rasi -p "Appareance")

case "$seleccion" in
    " Theme")
        ~/.config/colorschemes/apply-theme.sh
        ;;
    " Wallpapers")
        #~/.config/colorschemes/wallpapers.sh
        ~/.config/colorschemes/wallpapers-theme.sh
        ;;
    " Modes")
        notify-send "pruebas modes"
        ;;
    " Utilities")
        ~/.config/colorschemes/utilities.sh
        ;;
    " Fonts")
        ~/uni.sh
        ;;
    *)
        exit 1
        ;;
esac
