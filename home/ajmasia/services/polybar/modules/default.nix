{ pkgs, ... }:

let
  date = pkgs.callPackage ./date.nix { pkgs = pkgs; };
  power = pkgs.callPackage ./power.nix { pkgs = pkgs; };
  fs-base = pkgs.callPackage ./fs-base.nix { pkgs = pkgs; };
  fs-root = pkgs.callPackage ./fs-root.nix { pkgs = pkgs; };
  fs-home = pkgs.callPackage ./fs-home.nix { pkgs = pkgs; };
  workspaces = pkgs.callPackage ./workspaces.nix { pkgs = pkgs; };
in

builtins.concatStringsSep "" [
  date
  power
  fs-base
  fs-root
  fs-home
  workspaces
]
