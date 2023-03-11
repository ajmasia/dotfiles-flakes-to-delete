{ pkgs, config, ... }:

let
  userConfigPath = (import ../../global.nix).configHome;
in
{
  home = {
    packages = with pkgs; [ ];

    file = {
      ".config/bspwm/scripts".source = ./scripts;
    };
  };

  xsession = {
    enable = true;

    windowManager.bspwm = {
      enable = true;

      settings = {
        "border_width" = 0;
        "window_gap" = 12;
        "ignore_ewmh_struts" = "";
        "focus_follows_pointer" = true;
        "remove_disabled_monitors" = true;
        "merge_overlapping_monitors" = true;
        "pointer_follows_monitor" = true;
        "pointer_modifier" = "mod4";
        "pointer_action1" = "move";
        "pointer_action2" = "resize_corner";
        "automatic_scheme" = "spiral";
        "initial_polarity" = "first_child";
        "pointer_motion_interval" = 0.8;
      };

      rules = {
        "terminal-scpad" = {
          sticky = true;
          state = "floating";
          center = true;
          rectangle = "1896x1056+100+100";
        };
      };

      startupPrograms = [
        "sxhkd"
        "xsetroot -cursor_name left_ptr"
        "solaar -w hide -b solaar"
        "sleep 2 && synology-drive"
        "${userConfigPath}/bspwm/scripts/bspc_initialize-monitors"
        # "polybar dell-monitor 2>${userConfigPath}/polybar/logs/dell-monitor.log"
        # "polybar dell-external 2>${userConfigPath}/polybar/logs/dell-external.log"
        "notify-send 'Window Manager' 'Bspwm Startup finished' -i ~/.local/share/notify-icons/nixos.png"
      ];
    };
  };
}

