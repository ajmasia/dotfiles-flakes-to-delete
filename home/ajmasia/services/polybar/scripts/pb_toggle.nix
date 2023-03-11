{pkgs, ...}:

let
  xdotool = "${pkgs.xdotool}/bin/xdotool";
  bspc = "${pkgs.bspwm}/bin/bspc";
  polybar-msg = "${pkgs.polybar}/bin/polybar-msg";
  touch = "${pkgs.coreutils}/bin/touch";
  rm = "${pkgs.coreutils}/bin/rm";
  primary-monitor = "dell-monitor";
  secondary-monitor = "dell-external";
in
pkgs.writeScriptBin "pb_toggle" ''
  PRIMARY_MONITOR=$(${xdotool} search --name ${primary-monitor} getwindowpid)
  SECONDARY_MONITOR=$(${xdotool} search --name ${secondary-monitor} getwindowpid)
  FLAG=/tmp/polybar-toggle

  if [ -f /tmp/polybar-toggle ]; then 
    ${polybar-msg} -p ''$PRIMARY_MONITOR cmd toggle 
    ${polybar-msg} -p ''$SECONDARY_MONITOR cmd toggle 


    ${bspc} config top_padding 50

    ${rm} ''$FLAG
  else 
    ${polybar-msg} -p ''$PRIMARY_MONITOR cmd toggle 
    ${polybar-msg} -p ''$SECONDARY_MONITOR cmd toggle 

    ${bspc} config top_padding 0 

    ${touch} ''$FLAG
  fi
''
