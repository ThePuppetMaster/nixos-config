{ pkgs, hyprqt6enginePackages, ... }:

{
  home.packages = with pkgs; [
    hyprpicker
    hyprsysteminfo
    hyprqt6enginePackages.default
  ];
}
