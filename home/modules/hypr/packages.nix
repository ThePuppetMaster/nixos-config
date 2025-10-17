{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpicker
    hyprshot
    hyprsysteminfo
  ];
}
