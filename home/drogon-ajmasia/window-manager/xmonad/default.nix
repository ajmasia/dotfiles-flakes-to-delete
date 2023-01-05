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

      # extraPackages = haskellPackages: [
      #   haskellPackages.xmonad-contrib
      # ];

      config = ./config.hs;
      enableContribAndExtras = true;

      libFiles = {
        "DoomOne.hs" = pkgs.writeText "DoomOne.hs" ''
          module DoomOne where

          import XMonad

          colorScheme = "doom-one"

          colorBack = "#282c34"
          colorFore = "#bbc2cf"

          color01 = "#1c1f24"
          color02 = "#ff6c6b"
          color03 = "#98be65"
          color04 = "#da8548"
          color05 = "#51afef"
          color06 = "#c678dd"
          color07 = "#5699af"
          color08 = "#202328"
          color09 = "#5b6268"
          color10 = "#da8548"
          color11 = "#4db5bd"
          color12 = "#ecbe7b"
          color13 = "#3071db"
          color14 = "#a9a1e1"
          color15 = "#46d9ff"
          color16 = "#dfdfdf"

          colorTrayer :: String
          colorTrayer = "--tint 0x282c34"
        '';


        "TomorrowNight.hs" = pkgs.writeText "TomorrowNight.hs" ''
          module TomorrowNight where

          import XMonad

          colorScheme = "tomorrow-night"

          colorBack = "#1d1f21"
          colorFore = "#c5c8c6"

          color01 = "#1d1f21"
          color02 = "#cc6666"
          color03 = "#b5bd68"
          color04 = "#e6c547"
          color05 = "#81a2be"
          color06 = "#b294bb"
          color07 = "#70c0ba"
          color08 = "#373b41"
          color09 = "#666666"
          color10 = "#ff3334"
          color11 = "#9ec400"
          color12 = "#f0c674"
          color13 = "#81a2be"
          color14 = "#b77ee0"
          color15 = "#54ced6"
          color16 = "#282a2e"

          colorTrayer :: String
          colorTrayer = "--tint 0x1d1f21"
        '';

        "Dracula.hs" = pkgs.writeText "Dracula.hs" ''
          module Dracula where

          import XMonad

          colorScheme = "dracula"

          colorBack = "#282a36"
          colorFore = "#f8f8f2"

          color01="#000000"
          color02="#ff5555"
          color03="#50fa7b"
          color04="#f1fa8c"
          color05="#bd93f9"
          color06="#ff79c6"
          color07="#8be9fd"
          color08="#bfbfbf"
          color09="#4d4d4d"
          color10="#ff6e67"
          color11="#5af78e"
          color12="#f4f99d"
          color13="#caa9fa"
          color14="#ff92d0"
          color15="#9aedfe"
          color16="#e6e6e6"

          colorTrayer :: String
          colorTrayer = "--tint 0x282a36"
        '';
      };
    };
  };
}
