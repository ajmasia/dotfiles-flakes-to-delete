{ pkgs, config, ... }:
let
  userConfigPath = (import ../../../global.nix).configHome;

  touch = "${pkgs.coreutils}/bin/touch";
  echo = "${pkgs.coreutils}/bin/echo";

  bspc_restart = pkgs.callPackage ../../../window-manager/bspwm/scripts/bspc_restart.nix { };
in
pkgs.writeShellScriptBin "gb_check-startup" ''
  FLAG=${userConfigPath}/logged

  if [ ! -f $FLAG ]; then
      ${touch} $FLAG
  elif [ -f $FLAG ]; then
    ${echo} "restarting" >> ${userConfigPath}/log.log
    ${bspc_restart}/bin/bspc_restart
  fi
''

