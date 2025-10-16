{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    colloid-icon-theme
    libnotify
    #zed-editor
    vscodium

    kdePackages.dolphin

    nerd-fonts.jetbrains-mono
  ];
}
