{ inputs, pkgs, ... }:

let
  username = (import ./global.nix).userName;
  homeDirectory = (import ./global.nix).homeDirectory;
in
with pkgs;
{
  home = {
    inherit username homeDirectory;

    keyboard = {
      layout = "us";
      variant = "altgr-intl";
    };

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

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [
        "electron-12.2.3"
      ];
    };

    overlays = [
      # (import ./overlays/bin.nix)
      (f: p: { amd-controller = inputs.amd-controller.packages.x86_64-linux.default; })
    ];
  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;

  imports = builtins.concatMap import [
    ./xdg
    ./window-manager
    ./ui
    ./programs
    ./services
  ];
}

