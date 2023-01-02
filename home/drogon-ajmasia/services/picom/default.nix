{ pkgs, ... }:

with pkgs; {
  services.picom = {
    enable = true;

    activeOpacity = 1.0;
    inactiveOpacity = 0.8;
    vSync = true;
    backend = "glx";
    fade = true;
    fadeDelta = 5;
    opacityRules = [ "100:name *= 'i3lock'" ];
    shadow = true;
    shadowOpacity = 0.75;

    wintypes = {
      tooltip = { fade = true; shadow = false; opacity = 1.0; focus = true; full-shadow = false; };
      dock = { clip-shadow-above = true; };
      popup_menu = { shadow = false; };
      dropdown_menu = { shadow = false; };
    };
  };

}
