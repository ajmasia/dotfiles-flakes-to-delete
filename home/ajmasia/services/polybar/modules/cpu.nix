{ pkgs, ... }:

let
  name = "cpu";
  type = "internal/cpu";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [module/${name}]
  type = ${type}

  # https://github.com/polybar/polybar/wiki

  # cor
  interval = 0.5

  # labe
  label = %percentage%%
  label-foreground = ${colors.base.white}
  label-font = 19

  # format
  format = <ramp-coreload>
  format-suffix-foreground = ${colors.base.yellow}
  format-padding = 0
  format-font = 19

  # ramps
  ramp-coreload-foreground = ${colors.base.green}
  ramp-coreload-spacing = 2px
  ramp-coreload-0 = ▁
  ramp-coreload-1 = ▂
  ramp-coreload-2 = ▃
  ramp-coreload-3 = ▄
  ramp-coreload-4 = ▅
  ramp-coreload-5 = ▆
  ramp-coreload-6 = ▇
  ramp-coreload-7 = █

  ; ramp-coreload-3-foreground = ${colors.base.yellow}
  ramp-coreload-4-foreground = ${colors.base.yellow}
  ramp-coreload-5-foreground = ${colors.base.yellow}
  ramp-coreload-6-foreground = ${colors.base.orange}
  ramp-coreload-7-foreground = ${colors.base.red}
''

