{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
    hyprpicker
    hyprshot
    hyprsunset
    hyprsysteminfo
  ];
}
