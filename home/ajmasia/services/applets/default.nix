{ ... }:

{
  services = {
    network-manager-applet = {
      enable = false;
    };

    # enable PulseAudio system tray
    pasystray = {
      enable = false;
    };

    blueman-applet = {
      enable = false;
    };
  };
}
