{ pkgs, ... }:

{
  # TODO brake into submodules (?)
  home.packages = with pkgs; [
    brave
    colloid-icon-theme
    libnotify
    #zed-editor
    vscodium
    wl-clipboard

    kdePackages.dolphin

    nerd-fonts.jetbrains-mono
  ];
}
