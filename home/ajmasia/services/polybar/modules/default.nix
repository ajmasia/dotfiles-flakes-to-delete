{ pkgs, ... }:

let
  workspaces = pkgs.callPackage ./workspaces.nix { pkgs = pkgs; };
in

builtins.concatStringsSep "" [
  workspaces
]
