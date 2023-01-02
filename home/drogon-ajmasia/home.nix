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

    stateVersion = "22.11";
  };

  imports = builtins.concatMap import [
    ./window-manager
    ./ui
    ./xdg
    ./programs
    ./services
  ];
}

