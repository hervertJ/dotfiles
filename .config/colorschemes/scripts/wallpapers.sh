#!/bin/bash

DIR="$HOME/Pictures/Wallpapers"

# 2. Generar la lista con el formato exacto para iconos
SELECTED=$(find "$DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | while read -r path; do
    filename=$(basename "$path")
    echo -en "$filename\0icon\x1fthumbnail://$path\n"
done | rofi -dmenu -i -p "Seleccionar Wallpaper:" -show-icons -config ~/.config/rofi/wallpaper.rasi)

# 3. Si el usuario cancela (ESC), salir
if [ -z "$SELECTED" ]; then
    exit 0
fi

# 4. Aplicar con awww
# Nota: $SELECTED contendrá solo el nombre del archivo (gracias al formato anterior)
awww img "$DIR/$SELECTED" --transition-type center --transition-fps 60 --transition-step 255
#wal -i "$DIR/$SELECTED"

ln -sf "$DIR/$SELECTED" ~/.config/colorschemes/.current-wallpaper
