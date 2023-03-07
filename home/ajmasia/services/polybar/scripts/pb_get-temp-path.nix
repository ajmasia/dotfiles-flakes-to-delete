{ pkgs, ... }:

let
  notify = "${pkgs.libnotify}/bin/notify-send";
in
pkgs.writeShellScriptBin "pb_get-temp-path" ''
  echo "pb_get-temp-path script" >>~/.config/polybar/logs/dell-monitor.log
''


