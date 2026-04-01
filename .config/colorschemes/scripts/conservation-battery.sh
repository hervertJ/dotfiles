#!/bin/bash
FILE="/sys/class/power_supply/BAT0/charge_types"

if [ ! -f "$FILE" ]; then
    notify-send "Error" "No se encuentra el control de batería."
    exit 1
fi

CURRENT=$(cat "$FILE" | grep -o "\[.*\]")

if [ "$CURRENT" == "[Long_Life]" ]; then
    echo "Standard" | sudo tee "$FILE"
    notify-send "Batería" "Modo Conservación Desactivado (Carga Standard)"
else
    echo "Long_Life" | sudo tee "$FILE"
    notify-send "Batería" "Modo Conservación Activado (Long Life)"
fi
