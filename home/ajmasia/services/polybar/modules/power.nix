{ pkgs, ... }:

let
  name = "power";
  type = "custom/text";

  colors = pkgs.callPackage ../utils/colors.nix { };
  script = pkgs.callPackage ../scripts/pb_power.nix { };
in
''
  [module/${name}]
  type = ${type}

  # core
  click-left = ${script}/bin/pb_power 

  # content
  content = 
  content-foreground = ${colors.base.white}
  content-font = 20

''


