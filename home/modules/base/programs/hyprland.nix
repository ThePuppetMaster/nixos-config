{ pkgs, ... }:

{
  # Dynamic tiling Wayland compositor that doesn't sacrifice on its looks.
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    settings = {
      # Autostart.
      exec-once = [
        # Clipboard management.
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      # Monitors.
      monitor = [ ", 1920x1080@59, 0x0 , 1" ];

      # Look & Feel.
      general = {
        gaps_in = 4;
        gaps_out = 8;

        border_size = 2;
        resize_on_border = false;

        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        allow_tearing = false;

        layout = "dwindle";
      };
      decoration = {
        rounding = 4;
        rounding_power = 2;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;

          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = false;

          #size = 3;
          #passes = 1
          #vibrancy = 0.1696
        };
      };
      animations = {
        enabled = true;

        # Default curves.
        #                  X0,   Y0,   X1,   Y1
        bezier = [
          "easeOutQuint,   0.23, 1,    0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear,         0,    0,    1,    1"
          "almostLinear,   0.5,  0.5,  0.75, 1"
          "quick,          0.15, 0,    0.1,  1"
        ];

        # Default animations.
        #                 ONOFF, SPEED, CURVE,        [STYLE]
        animation = [
          "global,        1,     10,    default"
          "border,        1,     5.39,  easeOutQuint"
          "windows,       1,     4.79,  easeOutQuint"
          "windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
          "windowsOut,    1,     1.49,  linear,       popin 87%"
          "fadeIn,        1,     1.73,  almostLinear"
          "fadeOut,       1,     1.46,  almostLinear"
          "fade,          1,     3.03,  quick"
          "layers,        1,     3.81,  easeOutQuint"
          "layersIn,      1,     4,     easeOutQuint, fade"
          "layersOut,     1,     1.5,   linear,       fade"
          "fadeLayersIn,  1,     1.79,  almostLinear"
          "fadeLayersOut, 1,     1.39,  almostLinear"
          "workspaces,    1,     1.94,  almostLinear, fade"
          "workspacesIn,  1,     1.21,  almostLinear, fade"
          "workspacesOut, 1,     1.94,  almostLinear, fade"
          "zoomFactor,    1,     7,     quick"
        ];
      };
      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below.
        preserve_split = true; # You probably want this.
      };
      master = { "new_status" = "master"; };

      # Other settings.
      misc = {
        force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers.
        disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
        vfr = true; # VM
      };

      # Disable update info dialog.
      ecosystem = {
        no_update_news = true;
      };

      # Input.
      input = {
        "kb_layout" = "pl";
        "kb_variant" = "";
        "kb_model" = "";
        "kb_options" = "";
        "kb_rules" = "";

        numlock_by_default = true;

        follow_mouse = 1;
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        touchpad = {
          natural_scroll = false;
        };
      };
      gesture = [ "3, horizontal, workspace" ];

      # Windows and workspaces.
      windowrule = [
        "suppressevent maximize, class:.*" # Ignore maximize requests from apps. You'll probably like this.
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0" # Fix some dragging issues with XWayland
      ];

      # Keyboard bindings.
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, M, exit"

        # Applications.
        "$mainMod, Q, killactive"
        "$mainMod, R, exec, rofi -show drun"
        "$mainMod, T, exec, kitty"
        "$mainMod, B, exec, brave"
        "$mainMod, E, exec, codium"
        "$mainMod, F, exec, dolphin"
        "$mainMod, C, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

        # Screenshots.
        ", PRINT, exec, hyprshot -m output"
        "$mainMod, PRINT, exec, hyprshot -m window"
        "$shiftMod, PRINT, exec, hyprshot -m region"

        # Window management types.
        "$mainMod, V, togglefloating"
        "$mainMod, P, pseudo" # dwindle
        "$mainMod, J, togglesplit" # dwindle

        # Move focus.
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces.
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace.
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspace.
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces.
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      # Mouse bindings.
      bindm = [
        # Move/resize windows.
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Special keys bindings.
      bindel = [
        # Multimedia keys for volume and LCD brightness.
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];
    };
  };

  # Environment variables.
  home.file = {
    ".config/uwsm/env".text = ''
      export XCURSOR_SIZE=24

      export GDK_BACKEND=wayland,x11,*
      export QT_QPA_PLATFORM=wayland;xcb
      export QT_AUTO_SCREEN_SCALE_FACTOR=1
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export SDL_VIDEODRIVER=wayland
      export CLUTTER_BACKEND=wayland

      export XDG_CURRENT_DESKTOP=Hyprland
      export XDG_SESSION_TYPE=wayland
      export XDG_SESSION_DESKTOP=Hyprland
    '';

    ".config/uwsm/env-hyprland".text = ''
      export HYPRCURSOR_SIZE=24
    '';
  };
}
