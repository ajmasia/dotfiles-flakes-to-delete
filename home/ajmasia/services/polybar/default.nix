{ config, pkgs, ... }:

let
  userConfigPath = (import ../../global.nix).configHome;

  custom-polybar-package = pkgs.polybar.override {
    alsaSupport = true;
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  };

  # Main config
  base-config = import ./config.nix;

  # bars
  dell-monitor = pkgs.callPackage ./bars/dell-monitor.nix { pkgs = pkgs; };
  dell-external = pkgs.callPackage ./bars/dell-external.nix { pkgs = pkgs; };

  # tools
  # colors = builtins.readFile ./utils/colors.ini;
  separators = pkgs.callPackage ./utils/separators.nix { pkgs = pkgs; };

  # modules
  modules = pkgs.callPackage ./modules { };
in
with pkgs; {
  home = {
    packages = [ ];

    file = {
      ".config/polybar/scripts".source = ./scripts;
    };
  };

  services.polybar = {
    enable = true;

    package = custom-polybar-package;
    config = base-config;
    extraConfig = modules + separators + dell-monitor + dell-external;
    script = ''
      # Startup script
      # ${userConfigPath}/polybar/scripts/pb_startup
      polybar dell-monitor 2>${config.xdg.configHome}/polybar/logs/dell-monitor.log &
      polybar dell-external 2>${config.xdg.configHome}/polybar/logs/dell-external.log &
    '';
  };
}
