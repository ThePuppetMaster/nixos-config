{ pkgs, ... }:

{
  # Hyprland's idle daemon.
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # Avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        # Turn off screen while a locker is active.
        {
          timeout = 60;
          on-timeout = "pidof hyprlock && hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        # Suspend.
        {
          timeout = 900;
          on-timeout = "pidof hyprlock && systemctl suspend";
        }
      ];
    };
  };
}
