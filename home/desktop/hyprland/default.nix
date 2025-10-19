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

    plugins = with pkgs.hyprlandPlugins; [
      hyprscrolling
      hyprfocus
    ];
    settings = {
      monitor = [
        # "DP-1, 1920x1080@144, 0x0, 1"
        # "DP-2, 1920x1080@75, 1920x0, 1"
        "HDMI-A-1, 1920x1080@72, 0x0, 1"
      ];
      # workspace = "1, monitor:DP-1";
      workspace = "1, monitor:HDMI-A-1";
      exec-once = [
        "waypaper --restore"
        "swaybg"
        "fcitx5 -d -r"
        "fcitx5-remote -r"
      ];
      "$mod" = "SUPER";
      "$Left" = "H";
      "$Right" = "L";
      "$Up" = "K";
      "$Down" = "J";
      env = [
        "HYPRCURSOR_THEME,Bibata-Original-Classic"
        "HYPRCURSOR_SIZE,22"
        "XCURSOR_THEME,Bibata-Original-Classic"
        "XCURSOR_SIZE,22"
      ];
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      animations = {
        enabled = "yes";
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
          "windup, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind, slidefadevert"
          "hyprfocusIn, 1, 1.7, default"
          "hyprfocusOut, 1, 1.7, default"
        ];
      };

      general = {
        gaps_in = "5";
        gaps_out = "10";
        border_size = "0";
        layout = "scrolling";
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
        rounding = "3";
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
        kb_options = "ctrl:nocaps";
      };
      plugin = {
        hyprscrolling = {
          column_width = 0.7;
          fullscreen_on_one_column = false;
          follow_focus = false;
        };
        hyprfocus = {
          enabled = "yes";
          mode = "flash";
          onfocus = true;
        };
      };
    };
  };

  xdg.portal = {
    enable = true;
    configPackages = [ pkgs.xdg-desktop-portal-hyprland ];
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
