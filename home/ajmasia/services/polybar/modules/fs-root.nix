{ pkgs, ... }:

let
  name = "fs-root";
in
''
  [module/${name}]

  # https://github.com/polybar/polybar/wiki

  # core
  inherit = fs-base
  mount-0 = /

  # format
  format-mounted-prefix = 
  format-prefix-font = 0
''

