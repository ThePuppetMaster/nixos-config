{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    colloid-icon-theme
    libnotify
    #zed-editor
    vscodium
    wl-clipboard
    xdg-user-dirs

    kdePackages.dolphin

    nerd-fonts.jetbrains-mono
  ];
}
