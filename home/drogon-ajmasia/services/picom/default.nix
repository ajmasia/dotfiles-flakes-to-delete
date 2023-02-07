{ pkgs, ... }:

with pkgs; {
  services.picom = {
    enable = true;

    package = picom-jonaburg;

    vSync = true;
    backend = "glx";

    shadow = false;
    shadowExclude = [ ];

    activeOpacity = 1.0;
    inactiveOpacity = 0.88;
    opacityRules = [
      "100:class_g = 'Rofi'"
      "100:window_type = 'notification'"
    ];

    fade = true;
    fadeSteps = [ 0.03 0.03 ];
    fadeDelta = 8;
    fadeExclude = [ ];

    wintypes = import ./win-types.nix;
    settings = import ./settings.nix;
  };

}
