{ pkgs, ... }:

let
  username = "ajmasia";
  homeDirectory = "/home/${username}";
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

  imports = [
    (import ./xdg { inherit homeDirectory; })
  ]
  ++ builtins.concatMap import [
    ./window-manager
    ./services
    ./programs
  ];
}

