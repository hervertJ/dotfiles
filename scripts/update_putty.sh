#!/bin/bash

# Ruta del archivo generado por pywal
WAL_FILE="$HOME/.cache/wal/colors-putty.reg"
# Ruta de la configuración por defecto de PuTTY
PUTTY_DEFAULT="$HOME/.putty/sessions/Default%20Settings"

# 1. Verificar si el archivo de pywal existe
if [ ! -f "$WAL_FILE" ]; then
    echo "Error: No se encontró el archivo de pywal en $WAL_FILE"
    exit 1
fi

# 2. Asegurarse de que el archivo Default Settings de PuTTY exista
if [ ! -f "$PUTTY_DEFAULT" ]; then
    mkdir -p ~/.putty/sessions/
    touch "$PUTTY_DEFAULT"
fi

# 3. Limpiar los colores antiguos del archivo de PuTTY
sed -i '/^Colour/d' "$PUTTY_DEFAULT"

# 4. Procesar el archivo .reg y añadirlo al final de Default Settings
# Quitamos comillas, quitamos comentarios y arreglamos el formato
grep "Colour" "$WAL_FILE" | sed 's/"//g; s/[[:space:]]*;.*//' >> "$PUTTY_DEFAULT"

echo "¡Listo! Los colores de pywal se han aplicado a los Default Settings de PuTTY."
