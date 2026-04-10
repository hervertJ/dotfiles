#!/bin/bash

# Rutas
BASE_DIR="$HOME/.config/colorschemes/themes"
NVIM_FILE="$HOME/.config/nvim/lua/plugins/colorscheme.lua"
WAYBAR_STYLE="$HOME/.config/waybar/style.css"
ROFI_THEME="$HOME/.config/rofi/launcher.rasi"

selection=$(find "$BASE_DIR" -maxdepth 1 -type d -not -path "$BASE_DIR" -exec basename {} \; | rofi -dmenu -theme $HOME/.config/rofi/launcher-theme.rasi -p "Colorscheme:")

[[ -z "$selection" ]] && exit 0

CONF_FILE="$BASE_DIR/$selection/theme.conf"

if [[ -f "$CONF_FILE" ]]; then
    source "$CONF_FILE"
else
    # Si no hay theme.conf
    # KITTY_NAME="$selection"
    # NVIM_NAME="$selection"
    notify-send "No se encontró el theme.conf"
fi

# Wallpaper
awww img ~/Pictures/Wallpapers/"$WALLPAPER" --transition-type center --transition-fps 60 --transition-step 255
#ln -sf "$HOME/Pictures/Wallpapers/$WALLPAPER" ~/.config/colorschemes/.current-wallpaper

notify-send "Aplicando tema": "$selection"

# Kitty
kitten themes --reload-in=all "$KITTY_NAME"

# Neovim
sed -i "s/^colorscheme = .*/colorscheme = \"$NVIM_NAME\",/" "$NVIM_FILE"

# Waybar
ln -sf "$BASE_DIR/$selection/waybar/style.css" ~/.config/waybar/current-color-waybar.css

# Rofi
ln -sf "$BASE_DIR/$selection/rofi/colors.rasi" ~/.config/rofi/current-colors-rofi.rasi

pkill waybar && waybar & disown
