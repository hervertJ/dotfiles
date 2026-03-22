#!/bin/bash

# Configuración de rutas
BASE_DIR="$HOME/.config/colorschemes"
NVIM_FILE="$HOME/.config/nvim/lua/plugins/colorscheme.lua"
WAYBAR_STYLE="$HOME/.config/waybar/style.css"
ROFI_THEME="$HOME/.config/rofi/launcher.rasi"

# 1. Obtener la lista de temas dinámicamente (solo carpetas)
# Usamos 'find' para listar carpetas en el nivel 1 y quitar el path relativo
selection=$(find "$BASE_DIR" -maxdepth 1 -type d -not -path "$BASE_DIR" -exec basename {} \; | rofi -dmenu -theme $HOME/.config/rofi/launcher.rasi -p "Colorscheme:")

# Si el usuario cierra rofi sin elegir nada, salir
[[ -z "$selection" ]] && exit 0

# 2. Cargar variables del tema elegido
CONF_FILE="$BASE_DIR/$selection/theme.conf"

if [[ -f "$CONF_FILE" ]]; then
    source "$CONF_FILE"
else
    # Fallback: si no hay theme.conf, usar el nombre de la carpeta
    # KITTY_NAME="$selection"
    # NVIM_NAME="$selection"
    notify-send "No se encontró el theme.conf"
fi

# Wallpaper
swww img ~/Pictures/Wallpapers/"$WALLPAPER" --transition-type center --transition-fps 60 --transition-step 255

# 3. Aplicar cambios
notify-send "Aplicando tema: $selection"

# Kitty
kitten themes --reload-in=all "$KITTY_NAME"

# Neovim (Usamos las variables cargadas desde el .conf)
sed -i "s/^colorscheme = .*/colorscheme = \"$NVIM_NAME\",/" "$NVIM_FILE"

# Waybar (Importamos el CSS específico de la carpeta elegida)
# Nota: Asegúrate de que la ruta en el import sea la correcta para tu setup
sed -i "s|^@import.*|@import \"$BASE_DIR/$selection/waybar/style.css\";|" "$WAYBAR_STYLE"

sed -i "s|^@import.*|@import \"$BASE_DIR/$selection/rofi/colors.rasi\"|" "$ROFI_THEME"

# Reiniciar Waybar
pkill waybar && waybar & disown
