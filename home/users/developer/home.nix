{ config, lib, pkgs, ... }:

{
  home = {
    # User info.
    username = "developer";
    homeDirectory = "/home/developer";

    sessionVariables = { EDITOR = "vim"; };

    # Link assets to the specified location in home directory.
    file = {
      ".background".source = ./assets/background.png;
      ".face".source = ./assets/face.png;
    };

    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "25.05";
  };

  imports = [
    ../../modules/base
    ../../modules/extra
  ];

  disabledModules = [
    ../../modules/base/services/hypridle.nix
  ];

  # ../../modules/base/programs/hyprland.nix override
  wayland.windowManager.hyprland = with lib; {
    settings = {
      decoration.shadow.enabled = mkForce false;
      animations.enabled = mkForce false;
    };
  };
}
