{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      gh                # GitHub CLI tool.
      git               # Distributed version control system.
      vim               # Clone of the VI editor.
      wget              # Retrieving files using HTTP, HTTPS, and FTP.
      xdg-user-dirs     # Manage well known user directories.
    ];
    variables.EDITOR = "vim"; # Set the default editor to vim.
  };
}
