#!/bin/bash

opciones=" Theme\n Wallpapers\n Utilities\n Screenshots\n Fonts"
#opciones="Theme\nWallpapers\nModes\nUtilities\nFonts"

seleccion=$(printf "$opciones" | rofi -dmenu -theme $HOME/.config/rofi/launcher.rasi -p "Appareance")

case "$seleccion" in
  " Theme")
    ~/.config/colorschemes/scripts/theme.sh
    ;;
  " Wallpapers")
    ~/.config/colorschemes/scripts/wallpapers-theme.sh
    ;;
  " Utilities")
    ~/.config/colorschemes/scripts/utilities.sh
    ;;
  " Screenshots")
    ~/.config/colorschemes/scripts/directory-for-screenshots.sh
    ;;
  " Fonts")
    notify-send "hola"
    ;;
  *)
    exit 1
    ;;
esac
