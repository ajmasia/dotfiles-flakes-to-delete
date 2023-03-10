{ pkgs, config, ... }:
let
  userConfigPath = (import ../../../global.nix).configHome;

  xdotool = "${pkgs.xdotool}/bin/xdotool";
  xdo = "${pkgs.xdo}/bin/xdo";
  bspc = "${pkgs.bspwm}/bin/bspc";
  alacritty = "${pkgs.alacritty}/bin/alacritty";
  touch = "${pkgs.coreutils}/bin/touch";
  rm = "${pkgs.coreutils}/bin/rm";
in
pkgs.writeShellScriptBin "bspc_terminal-scrachpad" ''
  WINCLASS="$(${xdotool} search --class terminal-scpad)";
  FLAG=${userConfigPath}/terminal-scpad

  if [ -z "$WINCLASS" ]; then
      ${alacritty} --class terminal-scpad
  else
      if [ ! -f $FLAG ]; then
          ${touch} $FLAG && ${xdo} hide "$WINCLASS"
      elif [ -f $FLAG ]; then
          ${rm} $FLAG && ${xdo} show "$WINCLASS"
      fi
  fi
''
