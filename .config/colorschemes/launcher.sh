#!/bin/bash

# 1. Definir opciones separadas por una nueva línea (\n)
# En la terminal siempre usar Mono
# Fuera de la terminal siempre usar Propo
opciones=" Theme\n Wallpapers\n Waybar\n Modes\n Fonts"

# 2. Mostrar el menú y capturar la selección
# -dmenu: activa el modo menú
# -p: define el texto del prompt (el título del buscador)
seleccion=$(echo -e "$opciones" | rofi -dmenu -theme $HOME/.config/rofi/launcher.rasi -p "Appareance")

# 3. Lógica de acción (Case)
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
        # Si presionas ESC o cierras el menú sin elegir nada válido
        exit 1
        ;;
esac
