{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    package = null;
    enableCompletion = true;

    bashrcExtra = ''
      eval "$(starship init bash)"
    '';
  };
}
