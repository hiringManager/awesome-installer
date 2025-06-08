#!/bin/bash
# clone_dotfiles.sh — Clones elenapan dotfiles + fonts/icons

set -e

echo "🚀 Cloning elenapan dotfiles..."

if [ ! -d ~/dotfiles ]; then
    git clone https://github.com/elenapan/dotfiles.git ~/dotfiles
else
    echo "✅ dotfiles already cloned → pulling latest..."
    cd ~/dotfiles && git pull && cd ~
fi

echo "✅ elenapan dotfiles ready."

echo ""
echo "🚀 Fonts/icons step:"
echo "👉 Nerd fonts were installed via Home Manager."
echo "👉 Papirus icon theme installed."
echo "👉 GTK theme: install one of these:"
echo "    sudo dnf install arc-theme"
echo "    OR"
echo "    sudo dnf install adapta-gtk-theme"

echo ""
echo "🚀 Manual symlink step:"
echo "Example:"
echo "ln -s ~/dotfiles/.config/awesome ~/.config/awesome"
echo "ln -s ~/dotfiles/.config/alacritty ~/.config/alacritty"
echo "ln -s ~/dotfiles/.config/rofi ~/.config/rofi"
echo "ln -s ~/dotfiles/.config/picom ~/.config/picom"
echo "ln -s ~/dotfiles/.Xresources ~/.Xresources"

echo "✅ All done with dotfiles step."

