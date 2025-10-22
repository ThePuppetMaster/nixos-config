{ config, pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./rofi.nix

    ./packages.nix
  ];
}