{ lib, pkgs, ... }:
let
  hyprnome = "${lib.getExe pkgs.hyprnome}";
  # wlogoutLauncher = pkgs.writeShellScriptBin "wlogout-launch" ''
  #   #!/usr/bin/env bash
  #   A_1080=400
  #   B_1080=200
  #
  #   if pgrep -x "wlogout" > /dev/null; then
  #       pkill -x "wlogout"
  #       exit 0
  #   fi
  #
  #   resolution=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .height / .scale' | awk -F'.' '{print $1}')
  #   hypr_scale=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .scale')
  #   wlogout --protocol layer-shell -b 5 -T $(awk "BEGIN {printf \"%.0f\", $A_1080 * 1080 * $hypr_scale / $resolution}") -B $(awk "BEGIN {printf \"%.0f\", $B_1080 * 1080 * $hypr_scale / $resolution}") &
  # '';
in
{
  # home.packages = [ wlogoutLauncher ];
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Application Keybinds
      "$mod, B, exec, firefox-devedition"
      "$mod, T, exec, kitty"
      "$mod, E, exec, thunar"
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

      "$mod+Shift, Backspace, exec, wlogout" # show logout menu

      "$mod, I, exec, hyprlock"

      "$mod+Shift, P, exec, gpu-screen-recorder -w screen -f 60 -r 5 -c mp4 -k hevc -o /home/aden/Videos/Replays -df yes"
      "$mod+Shift, Bracketleft, exec, kill -USR1 $(pgrep gpu-screen-reco)"
      # "$mod+Shift, Bracketleft, exec, gpu-screen-recorder -w screen -f 60 -r 30 -c mp4 -o /home/aden/Videos/Replays -df yes"

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
    # bind = [
    #   # Application Keybinds
    #   "$mod, B, exec, firefox-devedition"
    #   "$mod, T, exec, kitty"
    #   "$mod, E, exec, thunar"
    #   "$mod, R, exec, pavucontrol"
    #
    #   # Window actions
    #   "$mod+Shift, Q, killactive"
    #   "$mod, W, togglefloating"
    #   "$mod, V, togglesplit"
    #   "$mod, F, fullscreen, 1"
    #   "$mod+Shift, F, fullscreen"
    #   "$mod+Ctrl, Escape, exec, killall waybar || waybar"
    #
    #   # Change Focused Tiled
    #   "$mod, $Left, scroller:movefocus, l"
    #   "$mod, $Right, scroller:movefocus, r"
    #   "$mod, $Up, scroller:movefocus, u"
    #   "$mod, $Down, scroller:movefocus, d"
    #
    #   # Move windows around
    #   "$mod+Shift, $Left, scroller:movewindow, l"
    #   "$mod+Shift, $Right, scroller:movewindow, r"
    #   "$mod+Shift, $Up, scroller:movewindow, u"
    #   "$mod+Shift, $Down, scroller:movewindow, d"
    #
    #   "$mod, comma, scroller:admitwindow"
    #   "$mod, period, scroller:expelwindow"
    #   "$mod, F, scroller:fitsize, active"
    #   "$mod, Y, scroller:fitsize, all"
    #   "$mod, semicolon, scroller:cyclesize, next"
    #   "$mod, apostrophe, scroller:cyclesize, previous"
    #
    #   "$mod+Shift, U, exec, ${hyprnome} --move"
    #   "$mod+Shift, I, exec, ${hyprnome} --previous --move"
    #
    #   "$mod, U, exec, ${hyprnome}"
    #   "$mod, I, exec, ${hyprnome} --previous"
    #
    #   "$mod, C, scroller:setmode, c"
    #   "$mod, V, scroller:setmode, r"
    #
    #   "$mod, G, scroller:jump"
    #   "$mod+Ctrl, G, scroller:toggleoverview"
    #
    #   # Utilities
    #   "$mod, Space, exec, pkill -x rofi || rofi -show drun" # Run rofi application launcher
    #   "$mod, G, exec, pkill -x rofi || rofi -show window" # Run rofi window switcher
    #
    #   ''$mod, P, exec, grim -g "$(slurp)" - | swappy -f -'' # Screenshot
    #
    #   "$mod, Backspace, exec, wlogout" # show logout menu
    #
    #   "$mod, I, exec, hyprlock"
    #
    #   # System control
    #   ",XF86AudioMute, exec, pamixer -t"
    #   "$mod+Shift, A, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
    # ];
    # bindm = [
    #   "$mod, mouse:272, movewindow"
    #   "$mod, mouse:273, resizewindow"
    #   "$mod, Z, movewindow"
    #   "$mod, X, resizewindow"
    # ];
    # bindel = [
    #   ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    #   ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
    #   ",XF86AudioRaiseVolume, exec, pamixer -i 5"
    #   ",XF86AudioLowerVolume, exec, pamixer -d 5"
    # ];
    # binde = [
    #   # Resize windows
    #   "$mod+Alt, $Right, resizeactive, 50 0"
    #   "$mod+Alt, $Left, resizeactive, -50 0"
    #   "$mod+Alt, $Up, resizeactive, 0 -50"
    #   "$mod+Alt, $Down, resizeactive, 0 50"
    # ];
  };
}
