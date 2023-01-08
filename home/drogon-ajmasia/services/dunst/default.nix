{ ... }:

{
  services.dunst = {
    enable = true;
    settings = import ./config.nix;
  };

}
