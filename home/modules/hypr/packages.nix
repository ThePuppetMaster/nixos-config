{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpicker
    hyprsysteminfo
  ];
}
