{ config, pkgs, ... }:

{
  imports = [
    ./hyprlock.nix
    ./hyprshot.nix
    ./packages.nix
  ];
}