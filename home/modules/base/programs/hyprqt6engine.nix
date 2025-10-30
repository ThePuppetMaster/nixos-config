{ pkgs, ... }:

{
  programs.hyprqt6engine = {
    enable = true;
    settings = {
      theme = {
        color_scheme = "catppuccin-macchiato";
        style = "kvantum-dark";
      };
    };
  };
}
