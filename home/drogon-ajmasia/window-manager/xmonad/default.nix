{ pkgs, ... }:

let
  wallpaper = (import ../../global.nix).wallpaper;
  startup = ''
    # startups programs
  '';
in
{
  home.packages = with pkgs; [
    # xmobar # A Minimalistic Text Based Status Bar
    # xorg.xkbcomp # keymaps modifier
    # xorg.xmodmap # keymaps modifier
    # xorg.xrandr # display manager (X Resize and Rotate protocol)
  ];

  xsession = {
    enable = true;

    initExtra = startup;

    windowManager.xmonad = {
      enable = true;

      # extraPackages = haskellPackages: [
      #   haskellPackages.xmonad-contrib
      # ];

      config = ./config.hs;
      enableContribAndExtras = true;

      # TODO: Move this libs to a separate files
      libFiles = {
        "DoomOne.hs" = ./lib/Colors/DoomOne.hs; 
        "TomorrowNight.hs" = ./lib/Colors/TomorrowNight.hs;
        "Dracula.hs" = ./lib/Colors/Dracula.hs;
      };
    };
  };
}
