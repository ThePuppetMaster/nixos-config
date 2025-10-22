{ config, pkgs, ... }:

{
  imports = [
    ./cliphist.nix
    ./mako.nix
  ];
}