{ pkgs, ... }:
let
  username = "ajmasia";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";
in
with pkgs; {
  home = {
    inherit username homeDirectory;
    stateVersion = "22.11";

    keyboard = {
      layout = "us";
      variant = "altgr-intl";
    };

    # User packages
    packages = (import ./packages.nix) pkgs;

    # Files to link to the user home
    file = (import ./files.nix) { };
  };

  xdg = {
    inherit configHome;
    enable = true;
  };

  imports = builtins.concatMap import [
    ./programs
  ];

  # programs = (import ./programs.nix) { pkgs = pkgs; lib = lib; builtins = builtins; };
}
