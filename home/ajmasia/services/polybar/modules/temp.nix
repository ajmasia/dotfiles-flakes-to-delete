{ pkgs, ... }:

let
  name = "temp";
  type = "internal/temperature";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [module/${name}]
  type = ${type}

  # https://github.com/polybar/polybar/wiki

  # core
  interval = 0.5
  thermal-zone = 0
  hwmon-path = ''${env:HWMON_PATH}
  base-temperature = 20
  warn-temperature = 80

  # label
  label = "%temperature-c%"
  label-foreground = ${colors.base.white}
  label-padding-left = 6px
  label-font = 19

  label-warn = "%temperature-c%"
  label-warn-foreground = ${colors.base.red}
  label-warn-padding-left = 6px
  label-warn-font = 19

  # format
  format = <ramp><label>
  format-warn = <ramp><label-warn>

  # ramps
  ramp-0 = ▁
  ramp-1 = ▂
  ramp-2 = ▃
  ramp-3 = ▄
  ramp-4 = ▅
  ramp-5 = ▆
  ramp-6 = ▇
  ramp-7 = █
  ramp-foreground = ${colors.base.green}
  ramp-4-foreground = ${colors.base.yellow}
  ramp-5-foreground = ${colors.base.yellow}
  ramp-6-foreground = ${colors.base.orange}
  ramp-7-foreground = ${colors.base.red}
  ramp-padding-left = 14px
  ramp-font = 19
''

