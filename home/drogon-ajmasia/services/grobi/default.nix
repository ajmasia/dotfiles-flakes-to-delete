{
  services.grobi = {
    enable = true;

    rules =
      let
        MAIN_MONITOR = "HDMI-A-0";
        PORTABLE_MONITOR = "DisplayPort-1";
      in
      [
        {
          name = "Home with two monitors connected";
          outputs_connected = [ MAIN_MONITOR PORTABLE_MONITOR ];
          configure_row = [ PORTABLE_MONITOR MAIN_MONITOR ];
          primary = MAIN_MONITOR;
          atomic = true;
        }
        {
          name = "Home with only main monitor connected";
          outputs_disconnected = [ PORTABLE_MONITOR ];
          outputs_connected = [ MAIN_MONITOR ];
          configure_single = MAIN_MONITOR;
          primary = MAIN_MONITOR;
          atomic = true;
        }
      ];
  };
}
