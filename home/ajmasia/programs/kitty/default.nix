{ ... }:

{
  programs.kitty = {
    enable = true;

    theme = "Tokyo Night Storm";

    settings = {
      font_family = "Hack Nerd Font";
      font_size = 13;
      window_padding_width = 4;
      window_border_width = 0;
      placement_strategy = "center";
      cursor_shape = "underline";
      window_resize_step_cells = 2;
      confirm_os_window_close = 0;
      shell_integration = "enabled";
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = "yes";
    };
  };
}
