{ pkgs, ... }:

let
  name = "fs-base";
  type = "internal/fs";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [${name}]
  type = ${type}

  # https://github.com/polybar/polybar/wiki

  # core
  interval = 25

  # label
  label-mounted = %used%
  label-mounted-foreground = ${colors.base.white}
  label-mounted-font = 19

  label-unmounted = %mountpoint%: not mounted
  label-unmounted-foreground = ${colors.base.red}


  # format
  format-padding = 0

  format-mounted = <label-mounted>
  format-mounted-prefix = 
  format-mounted-prefix-foreground = ${colors.base.purple}
  format-mounted-prefix-padding-right = 12px
  format-mounted-prefix-font = 6


  format-unmounted = <label-unmounted>
  format-unmounted-prefix = 
''
