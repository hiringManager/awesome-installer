#!/bin/bash
# install_system_packages.sh — System deps

set -e

echo "🚀 Installing system-level packages..."

sudo dnf install -y \
    brightnessctl \
    light \
    acpi \
    NetworkManager \
    network-manager-applet \
    wireplumber \
    pulseaudio-utils \
    git \
    curl \
    wget

echo "✅ System-level packages installed."

