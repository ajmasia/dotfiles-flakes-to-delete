{ pkgs, ... }:

let
  colors = pkgs.callPackage ../utils/colors.nix { };
  notify = "${pkgs.libnotify}/bin/notify-send";
  systemctl = "${pkgs.systemd}/bin/systemctl";
in
pkgs.writeShellScriptBin "pb_scs" ''
    USER_SERVICE_NAME=syncthing
    SERVICE_WEB_GUI_PORT=8384
    SERVIE_WEB_GUI_URL="http://localhost:''${SERVICE_WEB_GUI_PORT}"

    get_service_status() {
  	  echo $(${systemctl} --user is-active ''${USER_SERVICE_NAME}.service)
    }

    notify_satatus() {
      ${notify} "Syncthing service is $(get_service_status)"
    }

    start_service() {
      ${systemctl} --user start ''${USER_SERVICE_NAME}.service
      notify_satatus
    }

    stop_service() {
      ${systemctl} --user stop ''${USER_SERVICE_NAME}.service
      notify_satatus
    }

    restart_service() {
      ${systemctl} --user restart ''${USER_SERVICE_NAME}.service
      notify_satatus
    }

    open_service_web_gui() {
      xdg-open ''${SERVIE_WEB_GUI_URL}
    }

    show_service_status() {
      USER_SERVICE_STATUS=$(get_service_status)

      if [[ ''${USER_SERVICE_STATUS} == "active" ]]; then
        echo "%{B#21252b}%{F${colors.base.lime}}%{B- F-}"
      elif [[ ''${USER_SERVICE_STATUS} == "inactive" ]]; then
        echo "%{B#21252b}%{F${colors.base.grey}}%{B- F-}"
      else
        echo "%{B#21252b}%{F${colors.base.grey}}%{B- F-}"
      fi
    }

    case $1 in
      --start)
        start_service
        ;;
      --stop)
        stop_service
        ;;
      --restart)
        restart_service
        ;;
      --open)
        open_service_web_gui
        ;;
      --toggle)
        if [[ $(get_service_status) == "active" ]]; then
          stop_service
        else
          start_service
        fi
        ;;
      *)
        show_service_status
        ;;
    esac
''
