{ pkgs, ... }:

let
  unstablePackages = import <unstable> { };
  yarnWithNode16 = pkgs.yarn.overrideAttrs (oldAttrs: rec {
    buildInputs = with pkgs; [
      nodejs-16_x
    ];
  });
in
with pkgs; [
  # Terminal tools
  bc                  # GNU software calculator
  exa                 # A modern replacement for ls wirtten in Rust
  fd                  # A simple, fast and user-friendly alternative to find command
  file                # Shows the type of files
  fzy                 # A fast, simple fuzzy text selector for the terminal with an advanced scoring algorithm
  ripgrep             # A utility that combines the usability of The Silver Searcher with the raw speed of grep
  xclip               # Tool to access the X clipboard from a console application
  zip                 # Compressor/archiver for creating and modifying zipfiles
  unzip               # An extraction utility for archives compressed in .zip format
  lfs                 # Get information on your mounted disks
  btop                # A monitor of system resources
  lm_sensors          # Tools for reading hardware sensors
  tldr                # Simplified and community-driven man pages
  geekbench           # Cross-platform benchmark
  ajmasia-bin         # Personal scripts (see overlay)

  # CLIs
  telegram-cli        # Command-line interface for Telegram

  # Browsers
  google-chrome       # A freeware web browser developed by Google

  # UI
  feh                 # A light-weight image viewer

  # Fonts
  nerdfonts

  # Editors
  neovim
  vscode

  # Code builders, copilers & interpreters
  nodejs-16_x         # Node.js interpreter
  yarnWithNode16      # Node.js override with yarn
  python3Full         # Python interpreter
  cargo               # Rust builder & module manager
  gcc                 # GNU compiler collection tools
  cmake               # Cross-platform, open-source build system generator
  gnumake             # Tool to control the generation of non-source files from sources
  ghc                 # The Glasgow Haskell Compiler

  # Language Servers (LSPs)
  # haskell-language-server

  # Security
  bitwarden           # A secure and free password manager for all of your devices
  _1password-gui      # Multi-platform password manager
  _1password          # 1Password command-line tool

  # UI
  # Gnome
  gnome.dconf-editor
  # Xmonad
  xmobar              # A minimalistic status bar

  # Comunications
  tdesktop
  slack
  discord

  # Multimedia
  spotify

  # Graphical editors
  inkscape
  gimp

  # Graphical tools
  etcher              # Flash OS images to SD cards and USB drives, safely and easily
]

