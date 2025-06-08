# AwesomeWM Rice Installer (2025)

Automated installer for [elenapan/dotfiles](https://github.com/elenapan/dotfiles). Old Awesome config. Testing with Nixpkg in Fedora

## Structure

```text
awesomewm-rice-installer/
├── install.sh                     # Main orchestrator (prompts you for each step)
├── install_system_packages.sh     # Installs system packages
├── install_nix_home_manager.sh    # Installs Nix + Home Manager
├── setup_home_nix.sh              # Sets up Home Manager config (home.nix)
├── flake.nix                      # Optional flake version (fully reproducible)
├── clone_dotfiles.sh              # Clones elenapan dotfiles + fonts/icons
├── select_theme.sh                # Interactive theme selector
└── README.md                      # This file
