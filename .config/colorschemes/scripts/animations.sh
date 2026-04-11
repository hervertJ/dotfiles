#!/bin/bash

animations="$HOME/.config/hypr/hyprland/animations.conf"

if grep -q 'enabled *= *yes' "$animations"; then
  sed -i 's/\(enabled *= *\)yes/\1no/' "$animations"
  notify-send Animacines desactivadas
else
  sed -i 's/\(enabled *= *\)no/\1yes/' "$animations"
  notify-send Animacines activadas
fi
