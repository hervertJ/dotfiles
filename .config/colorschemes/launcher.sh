#!/bin/bash

opciones=" Theme\n Wallpapers\n Modes\n Utilities\n Fonts"
#opciones="Theme\nWallpapers\nModes\nUtilities\nFonts"

seleccion=$(echo -e "$opciones" | rofi -dmenu -theme $HOME/.config/rofi/launcher.rasi -p "Appareance")

case "$seleccion" in
  " Theme")
    ~/.config/colorschemes/scripts/theme.sh
    ;;
  " Wallpapers")
    #~/.config/colorschemes/wallpapers.sh
    ~/.config/colorschemes/scripts/wallpapers-theme.sh
    ;;
  " Modes")
    ~/.config/colorschemes/scripts/uni.sh
    ;;
  " Utilities")
    ~/.config/colorschemes/scripts/utilities.sh
    ;;
  " Fonts")
    notify-send "hola"
    ;;
  *)
    exit 1
    ;;
esac
