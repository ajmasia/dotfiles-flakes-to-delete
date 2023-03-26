{ pkgs, ... }:

let
  name = "cpu-profile";
  type = "custom/script";

  script = pkgs.callPackage ../scripts/pb_get_cpu_profile.nix { };
in
''
  [module/${name}]
  type = ${type}

  # write your config here
  # https://github.com/polybar/polybar/wiki

  # core
  exec = ${script}/bin/pb_get_cpu_profile
  interval = 5

  # label
  label = %output%
  label-font = 5
''

