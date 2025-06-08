#!/bin/bash
# setup_all.sh — Auto-setup: flake username + dotfiles symlinks

set -e

# === 1️⃣ Set username in flake.nix ===

FLAKE_FILE="./flake.nix"

if [ ! -f "$FLAKE_FILE" ]; then
    echo "❌ flake.nix not found!"
    exit 1
fi

USERNAME="${USERNAME:-$USER}"

echo "🚀 Setting username '$USERNAME' in flake.nix..."

sed -i "s|username = \"YOUR_USERNAME\";|username = \"$USERNAME\";|" "$FLAKE_FILE"

echo "✅ flake.nix updated."

# === 2️⃣ Auto-symlink dotfiles ===

DOTFILES_DIR="$HOME/dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "❌ dotfiles folder not found at $DOTFILES_DIR!"
    echo "👉 Please clone elenapan/dotfiles first."
    exit 1
fi

echo "🚀 Creating config symlinks..."

mkdir -p ~/.config

ln -sf "$DOTFILES_DIR/.config/awesome" ~/.config/awesome
ln -sf "$DOTFILES_DIR/.config/alacritty" ~/.config/alacritty
ln -sf "$DOTFILES_DIR/.config/rofi" ~/.config/rofi
ln -sf "$DOTFILES_DIR/.config/picom" ~/.config/picom
ln -sf "$DOTFILES_DIR/.Xresources" ~/.Xresources

echo "✅ Symlinks created."

# === Done ===

echo ""
echo "🚀 All done!"
echo "👉 Next step: you can run ./select_theme.sh to pick a theme."
echo "👉 Then reload AwesomeWM (Mod4 + Ctrl + R)."

