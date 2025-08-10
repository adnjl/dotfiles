{
  pkgs,
  lib,
  ...
}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        exclusive = true;
        passthrough = false;
        fixed-center = true;
        ipc = true;
        height = 14;
        margin-right = 10;
        margin-left = 10;
        margin-top = 2;

        modules-left = [
          "custom/menu"
          "custom/separator#blank_2"
          "clock"
          "custom/separator#blank_2"
          "hyprland/window"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "custom/swaync"
          "custom/separator#blank"
          "tray"
          "custom/separator#blank"
          "mpris"
          "custom/separator#blank"
          "pulseaudio"
          "custom/separator#blank"
          "pulseaudio#microphone"
          "custom/separator#blank"
          "custom/power"
        ];

        "clock" = {
          format = "{:%H:%M - %d/%b}";
          tooltip = false;
        };

        "hyprland/workspaces" = {
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
            active = " ";
            default = " ";
          };
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 40;
          separate-outputs = true;
          offscreen-css = true;
          offscreen-css-text = "(inactive)";
          rewrite = {
            "(.*) — Mozilla Firefox" = " $1";
            "(.*) - fish" = "> [$1]";
            "(.*) - zsh" = "> [$1]";
            "(.*) - kitty" = "> [$1]";
          };
        };

        "mpris" = {
          interval = 10;
          format = "{player_icon} ";
          format-paused = "{status_icon} <i>{dynamic}</i>";
          on-click-middle = "playerctl play-pause";
          on-click = "playerctl previous";
          on-click-right = "playerctl next";
          scroll-step = 5.0;
          smooth-scrolling-threshold = 1;
          player-icons = {
            "chromium" = "";
            "default" = "";
            "firefox" = "";
            "kdeconnect" = "";
            "mopidy" = "";
            "mpv" = "󰐹";
            "spotify" = "";
            "vlc" = "󰕼";
          };
          status-icons = {
            "paused" = "󰐎";
            "playing" = "";
            "stopped" = "";
          };
          max-length = 30;
        };

        "pulseaudio" = {
          format = "{icon}  {volume}%";
          format-bluetooth = "{icon} 󰂰 {volume}%";
          format-muted = "󰖁";
          format-icons = {
            "headphone" = " ";
            "hands-free" = " ";
            "headset" = " ";
            "phone" = "";
            "portable" = "";
            "car" = "";
            default = [
              ""
              ""
              "󰕾"
              ""
            ];
            ignored-sinks = [ "Easy Effects Sink" ];
          };
          scroll-step = 5.0;
          on-click = "pavucontrol -t 3";
          tooltip-format = "{icon} {desc} | {volume}%";
          smooth-scrolling-threshold = 1;
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          # on-click = "pavucontrol -t 4";
          on-click-right = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
          tooltip-format = "{source_desc} | {source_volume}%";
          scroll-step = 5;
        };

        "tray" = {
          icon-size = 15;
          spacing = 8;
        };

        "custom/menu" = {
          format = "{}";
          exec = "echo ; echo 󱓟 app launcher";
          interval = 86400;
          tooltip = true;
          on-click = "pkill rofi || rofi -show drun -modi run;drun,filebrowser,window";
          # "on-click-middle"= "~/.config/hypr/scripts/wallpaperSelect.sh";
          # "on-click-right"= "~/.config/hypr/scripts/WaybarLayout.sh";
        };

        "custom/power" = {
          format = "⏻ ";
          exec = "echo ; echo 󰟡 power // blur";
          on-click = "wlogout";
          interval = 86400;
          tooltip = true;
        };

        "custom/swaync" = {
          tooltip = true;
          format = "{icon} {}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        ## Separators
        "custom/separator#dot" = {
          format = "";
          interval = "once";
          tooltip = false;
        };

        "custom/separator#dot-line" = {
          format = "";
          interval = "once";
          tooltip = false;
        };

        "custom/separator#line" = {
          format = "|";
          interval = "once";
          tooltip = false;
        };

        "custom/separator#blank" = {
          format = "";
          interval = "once";
          tooltip = false;
        };

        "custom/separator#blank_2" = {
          format = "  ";
          interval = "once";
          tooltip = false;
        };

        "custom/separator#blank_3" = {
          format = "   ";
          interval = "once";
          tooltip = false;
        };

      };
    };
    style = lib.mkForce ./waybar.css;
    systemd.enable = true;
  };
}
