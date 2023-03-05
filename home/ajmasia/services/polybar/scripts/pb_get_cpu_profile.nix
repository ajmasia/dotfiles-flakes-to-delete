{ pkgs, ... }:

let
  amdController = "${pkgs.amd-controller}/bin/amd-controller";
in
pkgs.writeShellScriptBin "pb_get_cpu_profile" ''
  CURRENT_PROFILE=$(${amdController} -p)

  case $CURRENT_PROFILE in
  slow)
    echo "%{B#21252b}%{F#98c379}%{B- F-}"
    ;;
  medium)
    echo "%{B#21252b}%{F#61afef}%{B- F-}"
    ;;
  high)
    echo "%{B#21252b}%{F#e06c75}%{B- F-}"
    ;;
  fire)
    echo "%{B#21252b}%{F#e06c75}%{B- F-}"
    ;;
  *)
    echo "%{B#21252b}%{F#c678dd}%{T3}%{B- F-}"
    ;;
  esac
''


