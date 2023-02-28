{ pkgs, ... }:

let
  name = "date";
  type = "internal/date";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [module/${name}]
  type = ${type}

  # core
  interval = 1.0
  time = "%H:%M"
  date = "%a, %d %b %Y"

  # label
  label = %date% %time%
  label-font = 19

  # format
  format = <label>
''

