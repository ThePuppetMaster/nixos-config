{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    #Apps/utilities for the user.
    hypridle
    hyprland-qt-support
    hyprpaper
    hyprpicker
    hyprpolkitagent
    hyprshot
    hyprsunset
    hyprsysteminfo
    xdg-desktop-portal-hyprland

    # Libraries and other utilities.
    aquamarine
    hyprcursor
    hyprgraphics
    hyprland-qtutils
    hyprland-protocols
    hyprlang
    hyprutils
    hyprwayland-scanner
  ];
}
