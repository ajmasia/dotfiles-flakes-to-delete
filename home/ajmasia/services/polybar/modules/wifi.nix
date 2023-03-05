{ pkgs, ... }:

let
  name = "wifi";
  type = "internal/network";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [module/${name}]
  type = ${type}

  # core
  interface = wlp3s0
  unknown-as-up = true
  interval = 2.0
  tail = true

  # label
  label-connected = ""
  label-disconnected = ""

  # format
  format-connected =  <label-connected>
  format-connected-foreground = ${colors.base.white}
  format-connected-font = 5

  format-disconnected =  <label-disconnected>
  format-disconnected-foreground = ${colors.base.grey}
  format-disconnected-font = 5
''

