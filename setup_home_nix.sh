#!/bin/bash
# setup_home_nix.sh — Generates home.nix and applies

set -e

# Get USERNAME from env or default to $USER
USERNAME="${USERNAME:-$USER}"

echo "🚀 Setting up Home Manager config (home.nix) for user: $USERNAME"

mkdir -p ~/.config/home-manager

cat > ~/.config/home-manager/home.nix <<EOF
{ config, pkgs, ... }:

{
  home.username = "$USERNAME";
  home.homeDirectory = "/home/$USERNAME";

  home.packages = with pkgs; [
    awesome
    picom
    rofi
    feh
    alacritty
    zsh
    neofetch
    xclip

    playerctl
    ncmpcpp
    mpd
    brightnessctl
    acpi
    pulseaudio-utils
    xdotool

    lxappearance
    papirus-icon-theme
    networkmanagerapplet
    nerdfonts
  ];

  programs.zsh.enable = true;
  programs.alacritty.enable = true;

  home.stateVersion = "23.11";
}
EOF

echo "🚀 Applying Home Manager config..."
home-manager switch

echo "✅ Home Manager config applied."

