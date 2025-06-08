#!/bin/bash
# install.sh — Main orchestrator

set -e

# === CONFIGURATION ===

# Set your username here (used in flake.nix / home.nix):
USERNAME="$USER"

# === END CONFIGURATION ===

# Check USERNAME
if [[ -z "$USERNAME" || "$USERNAME" != "$USER" ]]; then
    echo "⚠️  USERNAME is not set or doesn't match current user."
    read -p "👉 Enter your Linux username (default: $USER): " input_username
    USERNAME="${input_username:-$USER}"
    echo "✅ Using username: $USERNAME"
else
    echo "✅ USERNAME detected: $USERNAME"
fi

echo ""
echo "🚀 Welcome to the AwesomeWM Rice Installer (2025)"
echo "==============================================="

# Step 1: System packages
read -p "👉 Run system package installer? (Y/n): " answer
[[ $answer =~ ^[Nn]$ ]] || ./install_system_packages.sh

# Step 2: Nix + Home Manager
read -p "👉 Run Nix + Home Manager installer? (Y/n): " answer
[[ $answer =~ ^[Nn]$ ]] || ./install_nix_home_manager.sh

# Step 3: Setup Home Manager config (home.nix or flake)? (Y/n): " answer
[[ $answer =~ ^[Nn]$ ]] || USERNAME="$USERNAME" ./setup_home_nix.sh

# Step 4: Clone dotfiles
read -p "👉 Clone elenapan dotfiles + fonts/icons? (Y/n): " answer
[[ $answer =~ ^[Nn]$ ]] || ./clone_dotfiles.sh

# Step 5: Select theme
read -p "👉 Run theme selector now? (Y/n): " answer
[[ $answer =~ ^[Nn]$ ]] || ./select_theme.sh

echo ""
echo "✅ All steps completed!"

