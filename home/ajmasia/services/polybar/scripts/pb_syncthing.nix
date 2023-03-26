{ pkgs, ... }:

let
  colors = pkgs.callPackage ../utils/colors.nix { };
  notify = "${pkgs.libnotify}/bin/notify-send";
  systemctl = "${pkgs.systemd}/bin/systemctl";
  curl = "${pkgs.curl}/bin/curl";
  bc = "${pkgs.bc}/bin/bc";
  jq = "${pkgs.jq}/bin/jq";

in
pkgs.writeShellScriptBin "pb_scs" ''
    USER_SERVICE_NAME=syncthing
    SERVICE_WEB_GUI_PORT=8384
    SERVICE_WEB_GUI_URL="http://localhost:''${SERVICE_WEB_GUI_PORT}"

    SYNCTHING_API_KEY=$(
      source ~/.env
      echo $SYNCTHING_API_KEY
    )

    SYNC_DEVICE_ID=$(
      source ~/.env
      echo $SYNC_DEVICE_ID
    )

    get_service_status() {
  	  echo $(${systemctl} --user is-active ''${USER_SERVICE_NAME}.service)
    }

    notify_satatus() {
      # TODO: add syncthing icons on notify-send
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
      xdg-open ''${SERVICE_WEB_GUI_URL} &
    }

    get_sync_status() {
      FOLDERS=$(${curl} -s -X GET -H "X-API-Key: ''${SYNCTHING_API_KEY}" "''${SERVICE_WEB_GUI_URL}/rest/config/folders" | ${jq} -r '.[].id')
      COMPLETION_SUM=0
      FOLDER_COUNT=0

      for FOLDER_ID in ''${FOLDERS}; do
        COMPLETION=$(${curl} -s -X GET -H "X-API-Key: ''${SYNCTHING_API_KEY}" "''${SERVICE_WEB_GUI_URL}/rest/db/completion?device=''${SYNC_DEVICE_ID}&folder=''${FOLDER_ID}" | ${jq} '.completion')
        COMPLETION_SUM=$(echo "''${COMPLETION_SUM} + ''${COMPLETION}" | ${bc})
        FOLDER_COUNT=$((''${FOLDER_COUNT} + 1))
      done

      if [ ''${FOLDER_COUNT} -gt 0 ]; then
        DEVICE_COMPLETION=$(echo "scale=2; ''${COMPLETION_SUM} / ''${FOLDER_COUNT}" | ${bc})
        echo "''${DEVICE_COMPLETION}"
      else
        echo "No folders shared with the device"
      fi
    }


    show_service_status() {
      USER_SERVICE_STATUS=$(get_service_status)
      # SYNC_STATUS=$(get_sync_status)

      # if [[ ''${USER_SERVICE_STATUS} == "active" && ''${SYNC_STATUS} == 100.00 ]]; then
      if [[ ''${USER_SERVICE_STATUS} == "active" ]]; then
        echo "%{B#21252b}%{F${colors.base.lime}}%{B- F-}"
      # elif [[ ''${USER_SERVICE_STATUS} == "active" && ''${SYNC_STATUS} != 100.00 ]]; then
      #   echo "%{B#21252b}%{F${colors.base.blue}}%{B- F-}"
      elif [[ ''${USER_SERVICE_STATUS} == "inactive" ]]; then
        echo "%{B#21252b}%{F${colors.base.grey}}%{B- F-}"
      else
        echo "%{B#21252b}%{F${colors.base.grey}}%{B- F-}"
      fi
    }
    
    help() {
      echo "Usage: $0 [--start|--stop|--restart|--toggle-service|--polybar-status|--open|--help|-h]"
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
      --sync-status)
        get_sync_status
        ;;
      --help | -h)
        help
        ;;
      *)
        show_service_status
        ;;
    esac
''
