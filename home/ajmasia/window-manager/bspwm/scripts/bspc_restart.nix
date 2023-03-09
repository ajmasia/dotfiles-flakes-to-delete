{ pkgs, ... }:

let
  notify = "${pkgs.libnotify}/bin/notify-send";
  pkill = "${pkgs.procps}/bin/pkill";
  systemctl = "${pkgs.systemd}/bin/systemctl";
  bspc = "${pkgs.bspwm}/bin/bspc";
in
pkgs.writeShellScriptBin "bspc_restart" ''
  ${pkill} sxhxd
  ${pkill} solaar
  ${pkill} -f cloud-drive-con 
  ${pkill} -f cloud-drive*

  ${systemctl} --user restart picom.service
  ${systemctl} --user restart polybar.service

  ${bspc} wm -r

  ${notify} 'Window Manager' \
    'Bspwm restart process finished' \
    -i '~/.local/share/notify-icons/nixos.png'
''
