{
  description = "elenapan dotfiles + AwesomeWM full rice — flake edition";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      username = "YOUR_USERNAME"; # <<< Will be replaced by setup script if automated
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            home.username = "${username}";
            home.homeDirectory = "/home/${username}";

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
        ];
      };
    };
}

