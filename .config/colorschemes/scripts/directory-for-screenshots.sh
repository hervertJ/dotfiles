#!/bin/bash

opciones=" Default\n Electromagnetismo\n Enrutamiento\n Lab-electrónica\n Estocásticos\n IA"

seleccion=$(echo -e "$opciones" | rofi -dmenu -theme $HOME/.config/rofi/launcher-theme.rasi -p "Utilities")

case "$seleccion" in
  " Default")
    sed -i 's|^env = HYPRSHOT_DIR.*|env = HYPRSHOT_DIR, /home/hervert/Pictures/Screenshots|' ~/.config/hypr/hyprland/variables.conf
    notify-send "Change directoty to:" "~/Pictures/Screenshots"
    ;;
  " Electromagnetismo")
    sed -i 's|^env = HYPRSHOT_DIR.*|env = HYPRSHOT_DIR, /home/hervert/privrepo/UNI/Electromagnetismo/PC1|' ~/.config/hypr/hyprland/variables.conf
    ;;
  " Enrutamiento")
    sed -i 's|^env = HYPRSHOT_DIR.*|env = HYPRSHOT_DIR, /home/hervert/privrepo/UNI/Enrutamiento/PC1/|' ~/.config/hypr/hyprland/variables.conf
    notify-send enrutamiento
    ;;
  " Lab-electrónica")
    notify-send directory change
    ;;
  " Estocásticos")
    sed -i 's|^env = HYPRSHOT_DIR.*|env = HYPRSHOT_DIR, /home/hervert/privrepo/UNI/Estocásticos/PC1/|' ~/.config/hypr/hyprland/variables.conf
    notify-send estoca
    ;;
  " IA")
    notify-send depuración
    ;;
  *)
    exit 1
    ;;
esac
