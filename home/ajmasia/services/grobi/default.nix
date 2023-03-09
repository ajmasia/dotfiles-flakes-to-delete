{ pkgs, config, ... }:
let
  wallpaper = (import ../../global.nix).wallpaper;
  restart = pkgs.callPackage ../../window-manager/bspwm/scripts/bspc_restart.nix { };
in
{
  services.grobi = {
    enable = true;

    rules =
      let
        MAIN_MONITOR = "HDMI-A-0";
        PORTABLE_MONITOR = "DisplayPort-1";
      in
      [
        {
          name = "Home with two monitors connected";
          outputs_connected = [ MAIN_MONITOR PORTABLE_MONITOR ];
          configure_row = [ PORTABLE_MONITOR MAIN_MONITOR ];
          primary = MAIN_MONITOR;
          atomic = true;
          execute_after = [
            "${pkgs.feh}/bin/feh --bg-fill ~/.local/share/wallpapers/${wallpaper}"
          ];
        }
        {
          name = "Home with only main monitor connected";
          outputs_disconnected = [ PORTABLE_MONITOR ];
          outputs_connected = [ MAIN_MONITOR ];
          configure_single = MAIN_MONITOR;
          primary = MAIN_MONITOR;
          atomic = true;
          execute_after = [
            "${pkgs.feh}/bin/feh --bg-fill ~/.local/share/wallpapers/${wallpaper}"
          ];
        }
        {
          name = "Home with only external monitor connected";
          outputs_disconnected = [ MAIN_MONITOR ];
          outputs_connected = [ PORTABLE_MONITOR ];
          configure_single = PORTABLE_MONITOR;
          primary = PORTABLE_MONITOR;
          atomic = true;
          execute_after = [
            "${pkgs.feh}/bin/feh --bg-fill ~/.local/share/wallpapers/${wallpaper}"
          ];
        }
      ];
    executeAfter = [
      # TODO: Pending to mange startup process
      # "${restart}/bin/bspc_restart"
      "${pkgs.libnotify}/bin/notify-send 'Monitors config has changed'"
    ];
  };
}
