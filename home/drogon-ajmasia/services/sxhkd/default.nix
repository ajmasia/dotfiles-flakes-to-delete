{ ... }:

{
  services.sxhkd = {
    enable = false;

    keybindings = import ./keybindings.nix;
  };
}
