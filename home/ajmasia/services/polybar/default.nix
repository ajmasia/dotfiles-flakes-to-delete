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
  base-config = pkgs.callPackage ./config.nix { };

  # bars
  dell-monitor = pkgs.callPackage ./bars/dell-monitor.nix { pkgs = pkgs; };
  dell-external = pkgs.callPackage ./bars/dell-external.nix { pkgs = pkgs; };

  # tools
  # colors = builtins.readFile ./utils/colors.ini;
  separators = pkgs.callPackage ./utils/separators.nix { pkgs = pkgs; };

  # modules
  modules = pkgs.callPackage ./modules { };

  # scripts
  # pb_get-temp-path = pkgs.callPackage ./scripts/pb_get-temp-path.nix { };
in
with pkgs; {
  home = {
    packages = [ custom-polybar-package ];
  };

  xdg = {
    configFile."polybar/config.ini".source = writeText "polybar.conf" ''
      ${base-config}
      ${modules}
      ${separators}
      ${dell-monitor}
      ${dell-external}
    '';
  };

  # services.polybar = {
  #   enable = true;

  #   package = custom-polybar-package;
  #   config = base-config;
  #   extraConfig = modules + separators + dell-monitor + dell-external;
  #   script = ''
  #     polybar dell-monitor 2>${config.xdg.configHome}/polybar/logs/dell-monitor.log &
  #     polybar dell-external 2>${config.xdg.configHome}/polybar/logs/dell-external.log &
  #   '';
  # };
}



