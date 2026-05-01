#!/bin/bash

sudo pacman -S --needed - < paquetes.txt

mv $HOME/.config/ $HOME/.config.bak/

mv $HOME/dotfiles/* $HOME/

rm -rf $HOME/dotfiles
rm $HOME/paquetes.txt
rm $HOME/install.sh
