{ config, lib, pkgs, ... }:

let
  cfg = config.programs.hyprqt6engine;
in
{
  options.programs.hyprqt6engine = {
    enable = lib.mkEnableOption "QT6 Theme Provider for Hyprland";
    package = lib.mkPackageOption pkgs "hyprqt6engine" { nullable = true; };

    settings = lib.mkOption {
      type = with lib.types;
        let
          valueType = nullOr (oneOf [
            bool
            int
            str
            (attrsOf valueType)
            (listOf valueType)
          ]) //
          {
            description = "hyprqt6engine configuration values";
          };
        in valueType;

      default = { };

      example = lib.literalExpression ''
        theme = {
          color_scheme = "catppuccin-macchiato";
          icon_theme = "Colloid-Dark";
          style = "kvantum-dark";
          font = "Sans Serif";
          font_size = 11;
          font_fixed = 11;
        };

        misc = {
          single_click_activate = true;
          menus_have_icons = true;
          shortcuts_for_context_menus = true;
        };
      '';

      description = ''
        Configuration options for hyprqt6engine written in Nix.
        See <https://wiki.hypr.land/Hypr-Ecosystem/hyprqt6engine/>.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    # Install package if defined.
    home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

    # Generate config file in proper Hyprland syntax.
    xdg.configFile."hypr/hyprqt6engine.conf" = lib.mkIf (cfg.settings != { }) {
      text = lib.hm.generators.toHyprconf { attrs = cfg.settings; };
    };
  };
}
