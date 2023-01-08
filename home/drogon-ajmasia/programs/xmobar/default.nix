{ pkgs, ... }:

{
  programs.xmobar = {
    enable = true;

    extraConfig = builtins.readFile ./config.hs;
  };
}
