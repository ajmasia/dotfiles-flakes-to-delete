{ pkgs, config, ... }:
let

  xdotool = "${pkgs.xdotool}/bin/xdotool";
  xdo = "${pkgs.xdo}/bin/xdo";
  bspc = "${pkgs.bspwm}/bin/bspc";
  alacritty = "${pkgs.alacritty}/bin/alacritty";
  touch = "${pkgs.coreutils}/bin/touch";
  rm = "${pkgs.coreutils}/bin/rm";
  echo = "${pkgs.coreutils}/bin/echo";
in
pkgs.writeShellScriptBin "bspc_terminal-scrachpad" ''
  WINCLASS="$(${xdotool} search --class terminal-scpad)";
  FLAG=/tmp/terminal-scpad

  if [ -z "$WINCLASS" ]; then
      ${alacritty} --class terminal-scpad
  else
      if [ ! -f ''$FLAG ]; then
          ${touch} ''$FLAG && ${xdo} hide "$WINCLASS"
      elif [ -f ''$FLAG ]; then
          ${rm} ''$FLAG && ${xdo} show "$WINCLASS"
      fi
  fi
''
