{ pkgs, config, ... }:
let
  userConfigPath = (import ../../../global.nix).configHome;

  xdotool = "${pkgs.xdotool}/bin/xdotool";
  xdo = "${pkgs.xdotool}/bin/xdo";
  bspc = "${pkgs.bspwm}/bin/bspc";
  alacritty = "${pkgs.alacritty}/bin/alacritty";
  touch = "${pkgs.coreutils}/bin/touch";
in
pkgs.writeShellScriptBin "bspc_terminal-scrachpad" ''
  winclass="$(${xdotool} search --class terminal-scpad)";
  tmp=${userConfigPath}/terminal-scpad

  if [ -z "$winclass" ]; then
      ${alacritty} --class terminal-scpad
  else
      if [ ! -f $tmp ]; then
          ${touch} $tmp && ${xdo} hide "$winclass"
      elif [ -f $tmp ]; then
          ""
      fi
  fi
''
