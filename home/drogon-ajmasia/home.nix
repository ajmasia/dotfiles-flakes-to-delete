{ pkgs, ... }:

let
  username = (import ./global.nix).userName;
  homeDirectory = (import ./global.nix).homeDirectory;
in
with pkgs; {
  home = {
    inherit username homeDirectory;

    keyboard = {
      layout = "us";
      variant = "altgr-intl";
    };

    # User packages
    packages = (import ./packages) pkgs;

    #  User aaets
    file = (import ./file) { };

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;

      name = "capitaine-cursors";
      package = capitaine-cursors;
    };

    stateVersion = "22.11";
  };

  fonts.fontconfig.enable = true;

  imports = builtins.concatMap import [
    ./window-manager
    ./ui
    ./xdg
    ./programs
    ./services
  ];
}

