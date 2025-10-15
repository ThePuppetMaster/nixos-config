{ config, pkgs, ... }:

{
  home.username = "developer";
  home.homeDirectory = "/home/developer";

  #home.file = {};

  home.sessionVariables = {
    EDITOR = "vim";
  };

  imports = [
    ../modules/bash.nix
    ../modules/kitty.nix
    ../modules/mako.nix
    ../modules/packages.nix
    ../modules/starship.nix
    ../modules/hypr/hyprland.nix
  ];

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
