{ config, lib, pkgs, hyprqt6enginePackages, ... }:

{
  home.username = "developer";
  home.homeDirectory = "/home/developer";

  home.file = {
    ".background".source = ./assets/background.png;
    ".face".source = ./assets/face.png;
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  imports = [
    ../../modules/hyprland/default.nix
    ../../modules/programs/default.nix
    ../../modules/services/default.nix
    ../../modules/shell/default.nix
  ];

  disabledModules = [
    ../../modules/hyprland/programs/hyprlock.nix
    ../../modules/hyprland/services/hypridle.nix
  ];

  # ../../modules/hyprland/default.nix override
  wayland.windowManager.hyprland = with lib; {
    settings = {
      decoration.shadow.enabled = mkForce false;
      animations.enabled = mkForce false;
    };
  };

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
