{ pkgs, ... }:

let
  bspwm = pkgs.callPackage ./bspwm.nix { pkgs = pkgs; };
  cpu = pkgs.callPackage ./cpu.nix { pkgs = pkgs; };
  cpu-profile = pkgs.callPackage ./cpu-profile.nix { pkgs = pkgs; };
  date = pkgs.callPackage ./date.nix { pkgs = pkgs; };
  docker = pkgs.callPackage ./docker.nix { pkgs = pkgs; };
  fs-base = pkgs.callPackage ./fs-base.nix { pkgs = pkgs; };
  fs-home = pkgs.callPackage ./fs-home.nix { pkgs = pkgs; };
  fs-root = pkgs.callPackage ./fs-root.nix { pkgs = pkgs; };
  mem = pkgs.callPackage ./memory.nix { pkgs = pkgs; };
  power = pkgs.callPackage ./power.nix { pkgs = pkgs; };
  temp = pkgs.callPackage ./temp.nix { pkgs = pkgs; };
  time = pkgs.callPackage ./time.nix { pkgs = pkgs; };
  wifi = pkgs.callPackage ./wifi.nix { pkgs = pkgs; };
  wire = pkgs.callPackage ./wire.nix { pkgs = pkgs; };
in

builtins.concatStringsSep "" [
  bspwm
  cpu
  cpu-profile
  date
  docker
  fs-base
  fs-home
  fs-root
  mem
  power
  temp
  time
  wifi
  wire
]
