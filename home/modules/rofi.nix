{ config, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    extraConfig = {
        modi = "run,drun,window";
        icon-theme = "Colloid-Catppuccin-Dark";
        show-icons = true;
        terminal = "kitty";
        drun-display-format = "{icon} {name}";
        location = 0;
        disable-history = false;
        hide-scrollbar = true;
        display-drun = "   Launch ";
        display-run = "   Run ";
        display-window = "   Window";
        sidebar-mode = true;
    };

    theme = {
      "*" = {
        background-color = mkLiteral "#1e1e2e";
        background-color-light = mkLiteral "#1e1e2e";
        border-color = mkLiteral "#89b4fa";
        selected-color = mkLiteral "#1e1e2e";
        blue = mkLiteral "#89b4fa";
        foreground-color = mkLiteral "#cdd6f4";
        foreground-color-2 = mkLiteral "#f38ba8";
        grey = mkLiteral "#6c7086";
        width = 600;
        font = "JetBrainsMono Nerd Font 14";
      };

      window = {
        height = 360;
        border = 2;
        border-color = mkLiteral "#89b4fa";
        border-radius = 4;
        background-color = mkLiteral "#1e1e2e";
      };

      mainbox = {
        background-color = mkLiteral "#1e1e2e";
      };

      inputbar = {
        children = map mkLiteral [ "prompt" "entry" ];
        background-color = mkLiteral "#1e1e2e";
        border-radius = mkLiteral "5px";
        padding = mkLiteral "2px";
      };

      prompt = {
        background-color = mkLiteral "#89b4fa";
        padding = mkLiteral "6px";
        text-color = mkLiteral "#1e1e2e";
        border-radius = mkLiteral "3px";
        margin = mkLiteral "20px 0px 0px 20px";
      };

      textbox-prompt-colon = {
        expand = false;
        str = ":";
      };

      entry = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 10px";
        text-color = mkLiteral "#cdd6f4";
        background-color = mkLiteral "#1e1e2e";
      };

      listview = {
        border = mkLiteral "0px 0px 0px";
        padding = mkLiteral "6px 0px 0px";
        margin = mkLiteral "10px 0px 0px 20px";
        columns = 2;
        lines = 5;
        background-color = mkLiteral "#1e1e2e";
      };

      element = {
        padding = mkLiteral "5px";
        background-color = mkLiteral "#1e1e2e";
        text-color = mkLiteral "#cdd6f4";
      };

      element-icon = {
        size = mkLiteral "25px";
      };

      "element selected" = {
        background-color = mkLiteral "#1e1e2e";
        text-color = mkLiteral "#f38ba8";
      };

      mode-switcher = {
        spacing = 0;
      };

      button = {
        padding = mkLiteral "10px";
        background-color = mkLiteral "#1e1e2e";
        text-color = mkLiteral "#6c7086";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };

      "button selected" = {
        background-color = mkLiteral "#1e1e2e";
        text-color = mkLiteral "#89b4fa";
      };

      message = {
        background-color = mkLiteral "#1e1e2e";
        margin = mkLiteral "2px";
        padding = mkLiteral "2px";
        border-radius = mkLiteral "5px";
      };

      textbox = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 20px";
        text-color = mkLiteral "#89b4fa";
        background-color = mkLiteral "#1e1e2e";
      };
    };
  };
}
