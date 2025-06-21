{
  pkgs,
  inputs,
  system,
  ...
}: {
    wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      monitor = [
	"DP-2, 1920x1080@144, 0x0, 1"
	"DP-1, 1920x1080@60, 1920x0, 1"
      ];
      workspace = "1, monitor:DP-2";
      exec-once = ["waypaper --restore" "swaybg"];
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
      bind = [
        # Application Keybinds
        "$mod, B, exec, firefox"
        "$mod, T, exec, kitty"
        "$mod, E, exec, dolphin"
        "$mod, R, exec, pavucontrol"

        # Window actions
        "$mod+Shift, Q, killactive"
        "$mod, W, togglefloating"
        "$mod, V, togglesplit"
        "$mod, F, fullscreen, 1"
        "$mod+Shift, F, fullscreen"
	"$mod+Ctrl, Escape, exec, killall waybar || waybar"

        # Move around
        "$mod, $Left, movefocus, l"
        "$mod, $Right, movefocus, r"
        "$mod, $Up, movefocus, u"
        "$mod, $Down, movefocus, d"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mod+Shift, 1, movetoworkspace, 1"
        "$mod+Shift, 2, movetoworkspace, 2"
        "$mod+Shift, 3, movetoworkspace, 3"
        "$mod+Shift, 4, movetoworkspace, 4"
        "$mod+Shift, 5, movetoworkspace, 5"
        "$mod+Shift, 6, movetoworkspace, 6"
        "$mod+Shift, 7, movetoworkspace, 7"
        "$mod+Shift, 8, movetoworkspace, 8"
        "$mod+Shift, 9, movetoworkspace, 9"
        "$mod+Shift, 0, movetoworkspace, 10"

        # move to the first empty workspace instantly
        "$mod+Ctrl, $Down, workspace, empty"
        "$mod+Ctrl, $Up, movetoworkspace, empty"

        # Special workspace
        "$mod, S, togglespecialworkspace"
        "$mod+Alt, S, movetoworkspacesilent, special"

        # Move windows around
        "$mod+Shift, $Left, movewindow, l"
        "$mod+Shift, $Right, movewindow, r"
        "$mod+Shift, $Up, movewindow, u"
        "$mod+Shift, $Down, movewindow, d"

        "$mod+Ctrl+Shift, $Right, movetoworkspace, r+1"
        "$mod+Ctrl+Shift, $Left, movetoworkspace, r-1"

        "$mod+Ctrl, $Right, workspace, r+1"
        "$mod+Ctrl, $Left, workspace, r-1"

        # Utilities
        "$mod, Space, exec, pkill -x rofi || rofi -show drun" # Run rofi application launcher
        "$mod, G, exec, pkill -x rofi || rofi -show window" # Run rofi window switcher

        ''$mod, P, exec, grim -g "$(slurp)" - | swappy -f -'' # Screenshot

        "$mod, Backspace, exec, wlogout" # show logout menu

        "$mod, I, exec, hyprlock"

        # System control
        ",XF86AudioMute, exec, pamixer -t"
	"$mod+Shift, A, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod, Z, movewindow"
        "$mod, X, resizewindow"
      ];
      bindel = [
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ",XF86AudioRaiseVolume, exec, pamixer -i 5"
        ",XF86AudioLowerVolume, exec, pamixer -d 5"
      ];
      binde = [
        # Resize windows
        "$mod+Alt, $Right, resizeactive, 50 0"
        "$mod+Alt, $Left, resizeactive, -50 0"
        "$mod+Alt, $Up, resizeactive, 0 -50"
        "$mod+Alt, $Down, resizeactive, 0 50"
      ];
      windowrulev2 = [
        "opacity 0.90 0.90,class:^(librewolf)$"
        "opacity 0.90 0.90,class:^(Brave-browser)$"
        "opacity 0.80 0.80,class:^(Steam)$"
        "opacity 0.80 0.80,class:^(steam)$"
        "opacity 0.80 0.80,class:^(steamwebhelper)$"
        "opacity 0.80 0.80,class:^(Spotify)$"
        "opacity 0.80 0.80,initialTitle:^(Spotify Premium)$"
        "opacity 0.80 0.80,initialTitle:^(Spotify Free)$"
        "opacity 0.80 0.80,class:^(code-oss)$"
        "opacity 0.80 0.80,class:^(Code)$"
        "opacity 0.80 0.80,class:^(code-url-handler)$"
        "opacity 0.80 0.80,class:^(code-insiders-url-handler)$"
        "opacity 0.80 0.80,class:^(kitty)$"
        "opacity 0.80 0.80,class:^(org.kde.dolphin)$"
        "opacity 0.80 0.80,class:^(org.kde.ark)$"
        "opacity 0.80 0.80,class:^(nwg-look)$"
        "opacity 0.80 0.80,class:^(qt5ct)$"
        "opacity 0.80 0.80,class:^(qt6ct)$"
        "opacity 0.80 0.80,class:^(kvantummanager)$"
        "opacity 0.80 0.80,class:^(waypaper)$"
        "opacity 0.80 0.80,class:^(org.pulseaudio.pavucontrol)$"
        "opacity 0.80 0.80,class:^(thunderbird)$"

        "opacity 0.90 0.90,class:^(com.github.rafostar.Clapper)$ # Clapper-Gtk"
        "opacity 0.80 0.80,class:^(com.github.tchx84.Flatseal)$ # Flatseal-Gtk"
        "opacity 0.80 0.80,class:^(hu.kramo.Cartridges)$ # Cartridges-Gtk"
        "opacity 0.80 0.80,class:^(com.obsproject.Studio)$ # Obs-Qt"
        "opacity 0.80 0.80,class:^(gnome-boxes)$ # Boxes-Gtk"
        "opacity 0.80 0.80,class:^(discord)$ # Discord-Electron"
        "opacity 0.80 0.80,class:^(vesktop)$ # Vesktop-Electron"
        "opacity 0.80 0.80,class:^(ArmCord)$ # ArmCord-Electron"
        "opacity 0.80 0.80,class:^(app.drey.Warp)$ # Warp-Gtk"
        "opacity 0.80 0.80,class:^(net.davidotek.pupgui2)$ # ProtonUp-Qt"
        "opacity 0.80 0.80,class:^(yad)$ # Protontricks-Gtk"
        "opacity 0.80 0.80,class:^(signal)$ # Signal-Gtk"
        "opacity 0.80 0.80,class:^(io.github.alainm23.planify)$ # planify-Gtk"
        "opacity 0.80 0.80,class:^(io.gitlab.theevilskeleton.Upscaler)$ # Upscaler-Gtk"
        "opacity 0.80 0.80,class:^(com.github.unrud.VideoDownloader)$ # VideoDownloader-Gtk"
        "opacity 0.80 0.80,class:^(lutris)$ # Lutris game launcher"

        "opacity 0.80 0.70,class:^(pavucontrol)$"
        "opacity 0.80 0.70,class:^(blueman-manager)$"
        "opacity 0.80 0.70,class:^(nm-applet)$"
        "opacity 0.80 0.70,class:^(nm-connection-editor)$"
        "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"

        "float,class:^(org.kde.dolphin)$,title:^(Progress Dialog — Dolphin)$"
        "float,class:^(org.kde.dolphin)$,title:^(Copying — Dolphin)$"
        "float,title:^(Picture-in-Picture)$"
        "float,class:^(librewolf)$,title:^(Library)$"
        "float,class:^(vlc)$"
        "float,class:^(kvantummanager)$"
        "float,class:^(qt5ct)$"
        "float,class:^(qt6ct)$"
        "float,class:^(nwg-look)$"
        "float,class:^(org.kde.ark)$"
        "float,class:^(org.pulseaudio.pavucontrol)$"
        "float,class:^(com.github.rafostar.Clapper)$ # Clapper-Gtk"
        "float,class:^(app.drey.Warp)$ # Warp-Gtk"
        "float,class:^(net.davidotek.pupgui2)$ # ProtonUp-Qt"
        "float,class:^(yad)$ # Protontricks-Gtk"
        "float,class:^(eog)$ # Imageviewer-Gtk"
        "float,class:^(io.github.alainm23.planify)$ # planify-Gtk"
        "float,class:^(io.gitlab.theevilskeleton.Upscaler)$ # Upscaler-Gtk"
        "float,class:^(com.github.unrud.VideoDownloader)$ # VideoDownloader-Gkk"
        "float,class:^(pavucontrol)$"
        "float,class:^(blueman-manager)$"
        "float,class:^(nm-applet)$"
        "float,class:^(nm-connection-editor)$"
        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "opacity 0.80 0.80,class:^(org.freedesktop.impl.portal.desktop.gtk)$"
        "opacity 0.80 0.80,class:^(org.freedesktop.impl.portal.desktop.hyprland)$"
      ];
      layerrule = [
        "blur,rofi"
        "ignorezero,rofi"
        "blur,notifications"
        "ignorezero,notifications"
        "blur,swaync-notification-window"
        "ignorezero,swaync-notification-window"
        "blur,swaync-control-center"
        "ignorezero,swaync-control-center"
        "blur,logout_dialog"
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
        gaps_out = "15";
        border_size = "4";
        #
        # the dot is a hyprland name, not nix syntax, so we escape it
        # "col.active_border" = "rgb(545975)";
        # "col.inactive_border" = "rgb(24273A)";
        layout = "dwindle";
        resize_on_border = "true";
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
      };
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        grace = 1;
      };
      # background = {
      #   monitor = "";
      #   path = "screenshot";
      #   blur_passes = 3;
      #   blur_size = 7;
      #   noise = 1.17e-2;
      #   contrast = 0.8916;
      #   brightness = 0.8172;
      #   vibrancy = 0.1696;
      #   vibrancy_darkness = 0.0;
      # };
      input-field = {
        monitor = "";
        size = "200, 50";
        outline_thickness = 3;
        dots_size = 0.33;
        dots_spacing = 0.15;
        dots_center = false;
        dots_rounding = -1;
        # outer_color = "rgb(151515)";
        # inner_color = "rgb(200, 200, 200)";
        # font_color = "rgb(10, 10, 10)";
        fade_on_empty = true;
        fade_timeout = 1000;
        placeholder_text = "<i>Input Password...</i>";
        hide_input = false;
        rounding = -1;
        # check_color = "rgb(204, 136, 34)";
        # fail_color = "rgb(204, 34, 34)";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        fail_timeout = 2000;
        fail_transition = 300;
        capslock_color = -1;
        numlock_color = -1;
        bothlock_color = -1;
        invert_numlock = false;
        swap_font_color = false;

        position = "0, -20";
        halign = "center";
        valign = "center";
      };
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
      before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
      after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
    };
  };

  xdg.portal = {
    enable = true;
    configPackages = [pkgs.xdg-desktop-portal-hyprland];
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
}

