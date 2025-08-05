{
  pkgs,
  ...
}:
{
  imports = [
    ./wlogout
  ];
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        grace = 1;
      };
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
      lock_cmd = "pidof hyprlock || hyprlock";
      before_sleep_cmd = "loginctl lock-session";
      after_sleep_cmd = "hyprctl dispatch dpms on";
    };
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
}
