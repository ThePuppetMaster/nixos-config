{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gh
    git
    home-manager
    vim
  ];
}
