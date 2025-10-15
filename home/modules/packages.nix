{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    cliphist
    colloid-icon-theme
    libnotify
    nerd-fonts-jetbrains-mono
    zed-editor

    kdePackages.dolphin
  ];
}
