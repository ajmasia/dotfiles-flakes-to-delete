{ pkgs, ... }:

let
  name = "fs-home";
in
''
  [module/${name}]

  # https://github.com/polybar/polybar/wiki

  # core
  inherit = fs-base
  mount-0 = /home

  # format
  format-mounted-prefix = 
  format-prefix-font = 0
''

