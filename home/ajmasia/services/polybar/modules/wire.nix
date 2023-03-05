{ pkgs, ... }:

let
  name = "wire";
  type = "internal/network";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [module/${name}]
  type = ${type}

  # core
  interface = eno1
  unknown-as-up = true
  interval = 2.0
  tail = true

  # label
  label-connected = "" 
  label-disconnected = "" 

  # format
  format-connected = <label-connected>
  format-connected-foreground = ${colors.base.white}
  format-connected-font = 6

  format-disconnected = <label-connected>
  format-disconnected-foreground = ${colors.base.grey}
  format-disconnected-font = 6
''

