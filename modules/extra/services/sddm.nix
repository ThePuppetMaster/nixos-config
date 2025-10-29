{ config, pkgs, ... }:

{
  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
      flavor = "macchiato";
      accent = "blue";
      font  = "Noto Sans";
      fontSize = "9";
      #background = "${./wallpaper.png}";
      loginBackground = true;
    }
  )];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-macchiato-blue";
  };
}
