#!/bin/bash
FILE="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
CURRENT=$(cat $FILE)

if [ "$CURRENT" -eq "0" ]; then
    echo 1 | sudo tee $FILE
    notify-send "Battery" "Modo Conservación Activado (60%)"
else
    echo 0 | sudo tee $FILE
    notify-send "Battery" "Modo Conservación Desactivado"
fi
