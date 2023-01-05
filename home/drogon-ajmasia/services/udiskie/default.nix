{ pkgs, ... }:

{
  home.packages = with pkgs; [
    at-spi2-core      # Assistive Technology Service Provider Interface protocol definitions and daemon for D-Bus
  ];

  services.udiskie = {
    enable = true;

    notify = true;
    tray = "auto";

    settings = {
      program_options = {
        udisks_version = 2;
      };

      icon_names = {
        media = [ "drive-removable-media" ];
        eject = [ "media-eject" ];
        unmount = [ "drive-optical" ];
        detach = [ "system-shutdown-symbolic" ];
        losetup = [ "drive-removable-media" ];
        mount = [ "drive-removable-media" ];

      };
    };
  };
}
