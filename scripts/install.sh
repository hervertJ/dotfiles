#!/bin/bash

sudo pacman -S --needed - < paquetes.txt

rm -rf $HOME/.config.bak
rm -rf $HOME/Pictures.bak
rm -rf $HOME/scripts.bak

mv $HOME/.config/ $HOME/.config.bak/
mv $HOME/Pictures/ $HOME/Pictures.bak/
mv $HOME/scripts/ $HOME/scripts.bak/

mv $HOME/dotfiles/* $HOME/

rm -rf $HOME/dotfiles
rm $HOME/paquetes.txt
rm $HOME/install.sh
