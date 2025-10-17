{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpicker
    hyprshot
    hyprsunset
    hyprsysteminfo
  ];
}
