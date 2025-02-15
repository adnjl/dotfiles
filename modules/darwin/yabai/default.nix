{
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      focus_follows_mouse = "autoraise";
      mouse_follows_focus = "on";
      window_placement = "second_child";
      window_opacity = "on";
      top_padding = 25;
      bottom_padding = 25;
      left_padding = 25;
      right_padding = 25;
      window_gap = 20;
      split_ratio = 0.5;
      split_type = "auto";
      layout = "bsp";
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";
      # external_bar = "all:25:0";
    };
    extraConfig = ''
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
      sudo yabai --load-sa
    '';
  };
  services.jankyborders = {
    enable = true;
    hidpi = true;
    inactive_color = "gradient(top_right=0xff232324,bottom_left=0xff232324)";
    active_color = "gradient(top_right=0xff353535,bottom_left=0xff353535)";
    blur_radius = 5.0;
  };
}
