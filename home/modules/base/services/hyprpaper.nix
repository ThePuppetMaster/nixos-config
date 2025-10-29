{ pkgs, ... }:

{
  # Blazing fast wayland wallpaper utility.
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "$HOME/.background" ];
      wallpaper = [ ", $HOME/.background" ];
    };
  };
}
