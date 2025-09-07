{
  lib,
  config,
  ...
}:
{
  programs.rofi = {
    enable = true;
    theme = lib.mkForce (
      let
        inherit (config.lib.formats.rasi) mkLiteral;

        mkRgba =
          opacity: color:
          let
            c = config.lib.stylix.colors;
            r = c."${color}-rgb-r";
            g = c."${color}-rgb-g";
            b = c."${color}-rgb-b";
          in
          mkLiteral "rgba ( ${r}, ${g}, ${b}, ${opacity}% )";

        mkRgb = mkRgba "100";

        rofiOpacity = builtins.toString (builtins.ceil (config.stylix.opacity.popups * 100));
      in
      {
        "*" = {
          font = "${config.stylix.fonts.monospace.name} ${toString config.stylix.fonts.sizes.popups}";
          text-color = mkRgb "base05";
          background-color = mkRgba rofiOpacity "base00";
        };
        "window" = {
          height = mkLiteral "20em";
          width = mkLiteral "30em";
          border-radius = mkLiteral "8px";
          border-width = mkLiteral "2px";
          padding = mkLiteral "1.5em";
        };
        "mainbox" = {
          background-color = mkRgba rofiOpacity "base01";
        };
        "inputbar" = {
          margin = mkLiteral "0 0 1em 0";
        };
        "prompt" = {
          enabled = false;
        };
        "entry" = {
          placeholder = "Search...";
          padding = mkLiteral "1em 1em";
          text-color = mkRgb "base05";
          background-color = mkRgba rofiOpacity "base00";
          border-radius = mkLiteral "8px";
        };
        "element-text" = {
          padding = mkLiteral "0.5em 1em";
          margin = mkLiteral "0 0.5em";
        };
        "element-icon" = {
          size = mkLiteral "3ch";
        };
        "element-text selected" = {
          background-color = mkRgba rofiOpacity "base0A";
          text-color = mkRgb "base01";
          border-radius = mkLiteral "8px";
        };
      }
    );
  };
}
