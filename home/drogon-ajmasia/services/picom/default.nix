{ pkgs, ... }:

with pkgs; {
  services.picom = {
    enable = true;

    package = picom-jonaburg;

    activeOpacity = 1.0;
    inactiveOpacity = 0.88;
    vSync = true;
    backend = "glx";
    fade = true;
    fadeSteps = [ 0.03 0.28 ];
    fadeDelta = 8;
    opacityRules = [
      "100:class_g = 'Rofi'"
    ];
    shadow = true;
    shadowOpacity = 0.75;

    wintypes = {
      tooltip = { fade = true; shadow = false; opacity = 1.0; focus = true; full-shadow = false; };
      dock = { shadow = false; clip-shadow-above = true; };
      dnd = { shadow = false; };
      popup_menu = { shadow = false; opacity = 1.0; };
      dropdown_menu = { shadow = false; opacity = 1.0; };
      utility = { shadow = false; opacity = 1.0; };
    };

    settings = {
      transition-pow-x = 0.1;
      transition-pow-y = 0.1;
      transition-pow-w = 0.1;
      transition-pow-h = 0.1;
      size-transition = true;
      spawn-center-screen = true;

      frame-opacity = 0.88;
      inactive-opacity-override = false;

      refresh-rate = 0;
      use-damage = false;
      log-level = "warn";

      # experimental-backends = true;

      mark-wmwin-focused = true;
      mark-ovredir-focused = false;

      detect-rounded-corners = true;
      detect-client-opacity = true;
      detect-transient = true;
      shadow-exclude = [
        "class_g = 'Slack'"
        "class_g = 'TelegramDesktop'"
      ];
    };
  };

}
