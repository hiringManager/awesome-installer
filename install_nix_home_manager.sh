#!/bin/bash
# install_nix_home_manager.sh

set -e

echo "🚀 Installing Nix package manager..."

if ! command -v nix >/dev/null 2>&1; then
    sh <(curl -L https://nixos.org/nix/install) --daemon
    echo "✅ Nix installed. Please log out & log back in before continuing!"
    exit 0
else
    echo "✅ Nix already installed."
fi

echo "🚀 Installing Home Manager..."

nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update

if ! command -v home-manager >/dev/null 2>&1; then
    nix-shell '<home-manager>' -A install
fi

echo "✅ Home Manager installed."

