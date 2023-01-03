{ pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  xsession = {
    enable = true;

    windowManager.bspwm = {
      enable = false;

      settings = {
        "border_width" = 2;
        "focused_border_color" = "#ffe613";
        # "normal_border_color" = "#ffffff";
        "window_gap" = 0;
        "ignore_ewmh_struts" = "";
        "focus_follows_pointer" = true;
        "remove_disabled_monitors" = true;
        "merge_overlapping_monitors" = true;
        "pointer_follows_monitor" = true;
        "pointer_modifier" = "mod4";
        "pointer_action1" = "move";
        "pointer_action2" = "resize_corner";
        "automatic_scheme" = "spiral";
        "initial_polarity" = "first_child";
        "pointer_motion_interval" = 0.8;
      };

    };
  };
}

