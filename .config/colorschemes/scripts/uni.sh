#!/bin/bash

opciones="Enrutamiento\nElectromagnetismo\nIA"

seleccion=$(echo -e "$opciones" | rofi -dmenu -theme $HOME/.config/rofi/launcher.rasi -p "Curso")

case "$seleccion" in
  "Enrutamiento")
    # abrir gns3
    cd ~/26-1/Enrutamiento
    kitty zellij --layout ~/.config/zellij/layouts/uni.kdl
    ;;
  "Electromagnetismo")
    cd ~/26-1/Electromagnetismo
    kitty zellij --layout ~/.config/zellij/layouts/uni.kdl
    ;;
  "IA")
    cd ~/26-1/IA
    kitty zellij --layout ~/.config/zellij/layouts/uni.kdl
    ;;
esac
