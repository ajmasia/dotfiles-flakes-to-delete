{ pkgs, ... }:

let
  name = "dell-monitor";

  monitor = "HDMI-1";
  fonts = pkgs.callPackage ../utils/fonts.nix { };
  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [bar/${name}]
  
  # Monitor settings
  monitor = ${monitor}
  monitor-strict = false

  # Fonts
  ${fonts}

  # Core settings
  enable-ipc = true
  wm-restack = bspwm
  override-redirect = false
  cursor-click  = pointer
  cursor-scroll = ns-resize

  # Position settings
  bottom = false
  fixed-center = true

  # Styles
  width = 100%:-24
  height = 38

  radius = 8

  offset-x = 12
  offset-y = 12

  padding-right = 2
  padding-left = 2

  module-margin-left = 0
  module-margin-right = 0

  underline-size = 0
  underline-colors = ${colors.fg}

  background = ${colors.bg}
  foreground = ${colors.fg}

  # Tray
  tray-position = right
  tray-detached = true
  tray-offset-x = -380
  tray-offset-y = 0
  tray-background = ${colors.bg}
  tray-foreground = ${colors.fg}
  tray-maxsize = 22
  tray-scale = 1.0

  # Modules
  modules-left = power sep-2 workspaces
  modules-center = fs-root sep-2 fs-home
  modules-right = date
''
