{ config, pkgs, ... }:

{
  imports = [
    ./hypridle.nix
    ./hyprpaper.nix
    ./hyprsunset.nix
  ];
}