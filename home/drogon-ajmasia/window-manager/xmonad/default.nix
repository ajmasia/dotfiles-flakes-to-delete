{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # xmobar # A Minimalistic Text Based Status Bar
    # xorg.xkbcomp # keymaps modifier
    # xorg.xmodmap # keymaps modifier
    # xorg.xrandr # display manager (X Resize and Rotate protocol)
  ];

  xsession = {
    enable = true;

    windowManager.xmonad = {
      enable = true;

      enableContribAndExtras = true;
      config = ./config.hs;
    };
  };
}