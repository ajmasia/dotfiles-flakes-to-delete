{ pkgs, ... }:

let
  name = "date";
  type = "internal/date";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [module/${name}]
  type = ${type}

  # https://github.com/polybar/polybar/wiki

  # core
  interval = 1.0
  time = "%H:%M"
  time-alt = "%a %d %b"

  # label
  label = %time%
  label-font = 19

  # format
  format = <label>
  format-suffix = 
  format-suffix-font = 6
  format-suffix-padding-left = 4px
  format-prefix-foreground = ${colors.base.white}
''

