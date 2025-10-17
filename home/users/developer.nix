{ config, pkgs, hyprqt6enginePackages, ... }:

{
  home.username = "developer";
  home.homeDirectory = "/home/developer";

  home.file = {
    ".background".source = ../assets/developer/background.png;
    ".face".source = ../assets/developer/face.png;
    ".config/hypr/catppuccin-macchiato-theme.conf".source = ../assets/developer/hyprland/catppuccin-macchiato-theme.conf;
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  imports = [
    ../modules/bash.nix
    ../modules/cliphist.nix
    ../modules/kitty.nix
    ../modules/mako.nix
    ../modules/packages.nix
    ../modules/rofi.nix
    ../modules/starship.nix

    ../modules/hypr/hyprland.nix
    ../modules/hypr/hyprpaper.nix
    ../modules/hypr/hyprshot.nix
    ../modules/hypr/packages.nix
  ];

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
