{ pkgs, ... }:
let
  custom-polybar-package = pkgs.polybar.override {
    alsaSupport = true;
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  };

  # main-bar = pkgs.callPackage ./bars/latop.nix { };
  # colors = builtins.readFile ./utils/colors.ini;
  # separators = builtins.readFile ./utils/separators.ini;
  # modules = pkgs.callPackage ./modules/main.nix { };
in

with pkgs; {
  services.polybar = {
    enable = false;

    package = custom-polybar-package;
  };
}
