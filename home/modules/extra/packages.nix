{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave               # Privacy-oriented browser.
  ];
}
