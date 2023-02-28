{ pkgs, ... }:

let
  notify = "${pkgs.libnotify}/bin/notify-send";
in
pkgs.writeShellScriptBin "pb_power" ''
  ${notify} "Power Menu not available" \
    "This feature will be here soon 😊" \
    -t 6000 -i $HOME/.local/share/notify-icons/alert.png
''

