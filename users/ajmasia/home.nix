{ pkgs, ... }:
let
  username = "ajmasia";
  homeDirectory = "/home/${username}";
  # configHome = "${homeDirectory}/.config";
in
with pkgs; {
  home = {
    inherit username homeDirectory;
    stateVersion = "22.11";

    keyboard = {
      layout = "us";
      variant = "altgr-intl";
    };

    # User installed packages
    packages = (import ./packages.nix) pkgs;
    # Files to link to the user home
    file = (import ./files.nix) { };
  };

  # xsession = {
  #   enable = true;

  #   windowManager = {
  #     xmonad = {
  #       enable = true;
  #       config = ./dotfiles/xmonad/xmonad.hs;
  #       enableContribAndExtras = true;
  #     };
  #   };

  #   initExtra = ''
  #     # Welcome sound
  #     # Set background
  #   '';
  # };

  programs = (import ./programs.nix) { pkgs = pkgs; lib = lib; builtins = builtins; };
}
