{ pkgs, ... }:

let
  name = "sync";
  type = "custom/script";

  script = pkgs.callPackage ../scripts/pb_syncthing.nix { };  
    
in
''
  [module/${name}]
  type = ${type}

  # write your config here
  # https://github.com/polybar/polybar/wiki

  # core
  exec = ${script}/bin/pb_scs &
  interval = 3
  click-right = ${script}/bin/pb_scs --toggle &
  click-left = ${script}/bin/pb_scs --open &

  # label
  label = %output%
  label-font = 5
''
