{ config, pkgs, ... }:

{
  programs.hyprshot = {
    enable = true;
    saveLocation = "$XDG_PICTURES_DIR";
  };
}