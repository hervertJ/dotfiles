#!/bin/bash

NAME=$(sed -n '1p' $HOME/.config/kitty/current-theme.conf)
ACTUAL_THEME="${NAME:1}"
echo "$ACTUAL_THEME"

# Rutas
DIR_WALL="$HOME/Pictures/Wallpapers"

echo "$DIR_WALL"

SELECTED=$(find "$DIR_WALL" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | while read -r path; do
    filename=$(basename "$path")
    echo -en "$filename\0icon\x1fthumbnail://$path\n"
done | rofi -dmenu -i -p "" -show-icons -config ~/.config/rofi/launcher-wallpaper.rasi)

if [ -z "$SELECTED" ]; then
    exit 0
fi

awww img "$DIR_WALL/$SELECTED" --transition-type center --transition-fps 60 --transition-step 255
#awww img "$DIR_WALL/penger/$SELECTED" --transition-type center --transition-fps 60 --transition-step 255

ln -sfn "../../Pictures/Wallpapers/$SELECTED" ~/.config/colorschemes/.current-wallpaper
