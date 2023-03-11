{ pkgs, ... }:

let
  name = "workspaces";
  type = "internal/bspwm";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [module/${name}]
  type = ${type}

  # core 
  pin-workspaces = true
  enable-click = true
  enable-scroll = true


  # labels
  label-monitor = %name%

  label-focused = 
  label-focused-foreground = ${colors.base.yellow}
  label-focused-padding = 1

  label-occupied = 
  label-occupied-foreground = ${colors.base.grey}
  label-occupied-padding = 1

  label-urgent = 
  label-urgent-foreground = ${colors.base.red}
  label-urgent-padding = 1

  label-empty = 
  label-empty-foreground = ${colors.base.yellow}
  label-empty-padding = 1

  # format
  format = <label-state>
  format-font = 3

  # icon-[0-9]+ = <desktop-name>;<icon>
  icon-0 = I;
  icon-1 = II;
  icon-2 = III;
  icon-3 = IV;
  icon-4 = V;
  icon-5 = VI;
  icon-6 = VII;
  icon-7 = VIII;
  icon-8 = IX;
  icon-default = 
''
