{ config, pkgs, ... }:

{
  services.hypridle = {
    enable = true;
    package = null;
  };
}
