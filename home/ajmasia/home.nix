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
    packages = (import ./packages.nix) pkgs;

    # Files to link to the user home
    file = (import ./files.nix) { };

    stateVersion = "22.11";
  };

  imports = [ (import ./xdg { inherit homeDirectory; }) ]
    ++ builtins.concatMap import [
    ./programs
  ];
}

