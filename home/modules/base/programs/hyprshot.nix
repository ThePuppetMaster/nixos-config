{ pkgs, ... }:

{
  # Utility to easily take screenshots in Hyprland.
  programs.hyprshot = {
    enable = true;
    saveLocation = "$XDG_PICTURES_DIR";
  };
}
