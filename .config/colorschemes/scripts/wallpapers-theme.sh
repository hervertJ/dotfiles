#!/bin/bash

NAME=$(sed -n '1p' $HOME/.config/kitty/current-theme.conf)
ACTUAL_THEME="${NAME:1}"
echo "$ACTUAL_THEME"

# Rutas
DIR_WALL="$HOME/.config/colorschemes/themes/$ACTUAL_THEME/wallpapers/"

echo "$DIR_WALL"

## 2. Generar la lista con el formato exacto para iconos
## Usamos un pipe directo a rofi para evitar errores de null bytes en variables
SELECTED=$(find "$DIR_WALL" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | while read -r path; do
    filename=$(basename "$path")
    echo -en "$filename\0icon\x1fthumbnail://$path\n"
done | rofi -dmenu -i -p "Seleccionar Wallpaper:" -show-icons -config ~/.config/rofi/launcher.rasi)

# 3. Si el usuario cancela (ESC), salir
if [ -z "$SELECTED" ]; then
    exit 0
fi

awww img "$DIR_WALL/$SELECTED" --transition-type center --transition-fps 60 --transition-step 255
