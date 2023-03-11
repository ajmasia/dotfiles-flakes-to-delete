{ pkgs, ... }:

let

  name = "docker";
  type = "custom/script";

  colors = pkgs.callPackage ../utils/colors.nix { };
  docker = "${pkgs.docker}/bin/docker";
  wc = "${pkgs.coreutils}/bin/wc";
in
''
  [module/${name}]
  type = ${type}

  # https://github.com/polybar/polybar/wiki

  # core
  exec = ${docker} ps -q | ${wc} -l
  interval = 1

  # format
  format-prefix = " "
  format-prefix-font = 17
  format-padding = 0
  format-foreground = ${colors.base.docker}

  # label
  label = %output%
  label-foreground = ${colors.base.white}
  label-font = 19

''
