{
  pkgs,
  inputs,
  system,
  ...
}:
{
  imports = [
    ./binds.nix
    ./windowrules.nix
    ./addons
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    # plugins = [ pkgs.hyprlandPlugins.hyprscroller ];
    settings = {
      monitor = [
        "DP-2, 1920x1080@144, 0x0, 1"
        "DP-1, 1920x1080@60, 1920x0, 1"
      ];
      workspace = "1, monitor:DP-2";
      exec-once = [
        "waypaper --restore"
        "swaybg"
      ];
      "$mod" = "SUPER";
      "$Left" = "H";
      "$Right" = "L";
      "$Up" = "K";
      "$Down" = "J";
      env = [
        "HYPRCURSOR_THEME,Bibata-Modern-Ice"
        "HYPRCURSOR_SIZE,26"
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,26"
      ];
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      animations = {
        enabled = "no";
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      general = {
        gaps_in = "5";
        gaps_out = "10";
        border_size = "2";
        # layout = "scroller";
        layout = "dwindle";
        resize_on_border = "true";
        allow_tearing = "true";
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      cursor = {
        hide_on_key_press = true;
      };

      decoration = {
        rounding = "1";
        # drop_shadow = "false";
        dim_special = "0.3";
        blur = {
          enabled = "yes";
          size = "3";
          passes = "3";
          new_optimizations = "on";
          ignore_opacity = "on";
          xray = "false";
          special = true;
        };
      };
      input = {
        sensitivity = "-0.65";
        force_no_accel = 1;
        follow_mouse = 1;
        accel_profile = "flat";
      };
      plugin.scroller = {
        column_widths = "onethird onehalf twothirds one";
        column_heights = "onethird onehalf twothirds one";
      };
    };
  };

  xdg.portal = {
    enable = true;
    configPackages = [ pkgs.xdg-desktop-portal-hyprland ];
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
