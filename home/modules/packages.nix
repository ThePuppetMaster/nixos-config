{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    cliphist
    colloid-icon-theme
    libnotify
    rofi
    zed-editor

    kdePackages.dolphin
  ];
}
