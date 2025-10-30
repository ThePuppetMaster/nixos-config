{ pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      layer = "top";
      markup = 1;
      anchor = "top-center";
      outer-margin = 10;
      margin = 24;
      padding = "8,8,8";
      width = 350;
      border-size = 2;
      border-radius = 4;
    };

    extraConfig = ''
      [urgency=low]
      border-color=#b8bb26
    '';
  };
}
