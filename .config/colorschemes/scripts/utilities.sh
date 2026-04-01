#!/bin/bash

opciones=" Battery\n Depuración"

seleccion=$(echo -e "$opciones" | rofi -dmenu -theme $HOME/.config/rofi/launcher.rasi -p "Utilities")

case "$seleccion" in
  " Battery")
    sh ~/.config/colorschemes/scripts/conservation-battery.sh
    ;;
  " Depuración")
    notify-send depuración
    ;;
  *)
    exit 1
    ;;
esac
