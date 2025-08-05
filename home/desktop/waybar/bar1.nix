{
  pkgs,
  lib,
  ...
}:
{
  programs.waybar = {
    # imports = [ ./modules ];
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        exclusive = true;
        passthrough = false;
        spacing = 3;
        # fixed-center = true;
        # ipc = true;
        reload-style-on-change = true;

        modules-left = [
          "clock#gar"
          "mpris"
          "tray"
          "custom/swaync"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "custom/backlight"
          "backlight/slider"
          "custom/speaker"
          "pulseaudio/slider"
          "battery#cam"
          "clock#cam"
          "network#cam"
        ];

        "hyprland/workspaces#cam" = {
          active-only = false;
          all-outputs = true;
          format = "{icon}";
          show-special = false;
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
          format-icons = {
            "1" = "Uno";
            "2" = "Due";
            "3" = "Tre";
            "4" = "Quattro";
            "5" = "Cinque";
            "6" = "Sei";
            "7" = "Sette";
            "8" = "Otto";
            "9" = "Nove";
            "10" = "Dieci";
          };
        };

        "hyprland/window#cam" = {
          format = "{title}";
          max-length = 50;
          rewrite = {
            "(.*) — Mozilla Firefox" = " $1";
            "(.*) - zsh" = "> [$1]";
          };
          separate-outputs = true;
        };

        "clock#cam" = {
          interval = 60;
          format = "{=%A; %H=%M}";
          max-length = 25;

        };

        "battery#cam" = {
          interval = 60;
          align = 0;
          rotate = 0;
          full-at = 100;
          design-capacity = false;
          states = {
            "critical" = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = " {capacity}%";
          format-plugged = "󱘖 {capacity}%";
          format-full = "{icon} Full";
          format-alt = "{icon} {time}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          format-time = "{H}h {M}min";
          tooltip = true;
          tooltip-format = "{timeTo} {power}w";
        };

        "pulseaudio/slider" = {
          min = 0;
          max = 100;
          orientation = "horizontal";

        };

        "custom/speaker" = {
          exec = "echo '🔊'";
          interval = 1;
          format = "{}";
        };

        "backlight/slider" = {
          min = 0;
          max = 100;
          orientation = "horizontal";
        };

        "custom/backlight" = {
          exec = "echo '✨'";
          interval = 1;
          format = "{}";
        };

        "tray#cam" = {
          spacing = 10;
        };

        "network#cam" = {
          format = "{ifname}";
          format-wifi = "{icon}";
          format-ethernet = "󰌘";
          format-disconnected = "󰌙";
          tooltip-format = "{ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-linked = "󰈁 {ifname} (No IP)";
          tooltip-format-wifi = "{essid} {icon} {signalStrength}%";
          tooltip-format-ethernet = "{ifname} 󰌘";
          tooltip-format-disconnected = "󰌙 Disconnected";
          max-length = 50;
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
        };

        "wlr/taskbar" = {
          format = "{icon}";
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
          ignore-list = [
            "kitty"
          ];
          app_ids-mapping = {
            "firefoxdeveloperedition" = "firefox-developer-edition";
          };
          rewrite = {
            "Firefox Web Browser" = "Firefox";
            "Foot Server" = "Terminal";
          };
        };

      };
    };
    style = lib.mkForce ./waybar.css;
    systemd.enable = true;
  };
}
