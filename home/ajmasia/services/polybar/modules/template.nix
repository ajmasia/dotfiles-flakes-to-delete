{ pkgs, ... }:

let
  name = "";
  type = "";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [module/${name}]
  type = ${type}

  # write your config here
  # https://github.com/polybar/polybar/wiki

  # core

  # content

  # label

  # format

  # icons

  # ramps
''

