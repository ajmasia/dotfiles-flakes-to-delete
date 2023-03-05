{ pkgs, ... }:

let
  name = "time";
  type = "internal/date";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [module/${name}]
  type = ${type}

  # core
  interval = 1.0
  time = "%H:%M"

  # label
  label = %time%
  label-font = 19

  # format
  format = <label>
''

