{
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
        mode = "dock";
        exclusive = true;
        passthrough = false;
        height = 30;
        reload-style-on-change = true;
        margin-top = 10;
        width = 1300;
        modules-left = [
        "custom/padd"
        "custom/l_end" "hyprland/workspaces" "custom/r_end"
        "custom/padd"]; # "hyprland/window"
        # modules-center = ["hyprland/workspaces"];
        # modules-right = ["tray" "network" "cpu" "battery" "backlight" "pulseaudio" "pulseaudio#microphone"];
        # modules-right = ["tray" "pulseaudio" "network" "clock" "cpu"];
        modules-right = [
            "custom/padd"
            "custom/l_end" "custom/audio-icon" "pulseaudio" "custom/r_end"
            "custom/padd"
            "custom/l_end" "custom/network-icon" "network" "custom/r_end"
            "custom/padd"
            "custom/l_end" "clock" "custom/r_end"
            "custom/padd"
            "custom/l_end" "custom/cpu-icon" "cpu" "custom/r_end"
            "custom/padd"
        ];

        "custom/audio-icon" = {
          format= " ";
          interval= "once";
          tooltip= false;
        };

        "custom/network-icon" = {
          format = "󰤨 ";
          interval = "once";
          tooltip = false;
        };
        
        "custom/cpu-icon" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };

        cpu = {
          interval = 10;
          format = "{usage}%";
          rotate = 0;
          tooltip = false;
        };
        
        "hyprland/workspaces" = {
          format = "<span font='12px'>{icon}</span>";
          format-icons = {
              active = "<big>󱨇</big>";
              default = "<big></big>";
          };
          disable-scroll = true;
          rotate = 0;
          all-outputs = true;
          active-only = false;
          on-click = "activate";
          persistent-workspaces = {
            "*" = 5;
          };
        };
        
        network = {
          tooltip = false;
          format-wifi = "{essid}";
          rotate = 0;
          format-ethernet = "󰈀 ";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = "DISCONNECTED";
          interval = 2;
        };

        pulseaudio = {
          format = "{volume} %";
          rotate = 0;
          format-muted = "MUTE";
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          scroll-step = 5;
          tooltip = false;
        };
        clock = {
          format = "{:%I:%M %p / %d %B}";
          rotate = 0;
          ormat-alt = "{:%I:%M %p / %d %B}";
          tooltip = false;
        };


        "custom/l_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };

        "custom/r_end" = {
            format = " ";
            interval = "once";
            tooltip = false;
        };

        "custom/padd" = {
            format = " ";
            interval = "once";
            tooltip = false;
        };
      };
    };
    style = lib.mkForce ./waybar.css;
    systemd.enable = true;
  };
}
