{ pkgs, ... }:

let
  notify = "${pkgs.libnotify}/bin/notify-send";
  cat = "${pkgs.coreutils}/bin/cat";
  basename = "${pkgs.coreutils}/bin/basename";
  dirname = "${pkgs.coreutils}/bin/dirname";
in
# TODO: see how use this script inside module
pkgs.writeShellScriptBin "pb_get-temp-path" ''
  for i in /sys/class/hwmon/hwmon*/temp*_input; do
    if [ "$(<$(${dirname} $i)/name): $(${cat} ''${i%_*}_label 2>/dev/null || echo $(${basename} ''${i%_*}))" = "k10temp: Tctl" ]; then
      echo $i
    fi
  done
''
