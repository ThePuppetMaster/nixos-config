{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "$HOME/.background" ];
      wallpaper = [ ", $HOME/.background" ];
    };
  };
}