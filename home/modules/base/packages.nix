{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Hypr*
    hyprpicker      # Wlroots-compatible Wayland color picker.
    hyprsysteminfo  # Tiny qt6/qml application to display system info.
    # TODO Manage in separate module.
    hyprqt6engine   # QT6 Theme Provider for Hyprland.

    # Utility
    libnotify       # Lib that sends desktop notifications to a daemon.
    wl-clipboard    # Command-line copy/paste utilities for Wayland.

    # KDE apps
    kdePackages.dolphin
  ];
}
