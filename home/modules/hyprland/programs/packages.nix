{ pkgs, hyprqt6enginePackages, ... }:

{
  # TODO brake into submodules (?)
  home.packages = with pkgs; [
    hyprpicker
    hyprsysteminfo
    hyprqt6enginePackages.default
  ];
}
