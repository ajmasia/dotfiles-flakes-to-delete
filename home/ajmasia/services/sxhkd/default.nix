{ pkgs, ... }:

{
  services.sxhkd = {
    enable = true;

    keybindings = import ./keybindings.nix { pkgs = pkgs; };
  };
}
