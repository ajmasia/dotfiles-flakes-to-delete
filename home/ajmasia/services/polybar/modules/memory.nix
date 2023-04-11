{ pkgs, ... }:

let
  name = "mem";
  type = "internal/memory";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [module/${name}]
  type = ${type}

  # https://github.com/polybar/polybar/wiki

  # core
  interval = 1

  # label
  label = " %percentage_used:2%%"
  label-foreground = ${colors.base.white}
  label-font = 19

  # format
  format = <bar-used> 
  format-prefix-font = 13
  format-foreground = ${colors.base.yellow}
  format-padding = 0
  format-font = 19

  # ramps
  ramp-used-0 = ▁
  ramp-used-1 = ▂
  ramp-used-2 = ▃
  ramp-used-3 = ▄
  ramp-used-4 = ▅
  ramp-used-5 = ▆
  ramp-used-6 = ▇
  ramp-used-7 = █

  # bars
  bar-used-indicator =
  bar-used-width = 16
  bar-used-foreground-0 = ${colors.base.green}
  bar-used-foreground-1 = ${colors.base.yellow}
  bar-used-foreground-2 = ${colors.base.orange}
  bar-used-foreground-3 = ${colors.base.red}
  bar-used-fill = ▐
  bar-used-empty = ▐
  bar-used-empty-foreground = #444444
''

