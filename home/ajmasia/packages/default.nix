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
  # System & Terminal tools
  bc # GNU software calculator
  exa # A modern replacement for ls wirtten in Rust
  fd # A simple, fast and user-friendly alternative to find command
  file # Shows the type of files
  fzy # A fast, simple fuzzy text selector for the terminal with an advanced scoring algorithm
  ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
  xclip # Tool to access the X clipboard from a console application
  zip # Compressor/archiver for creating and modifying zipfiles
  unzip # An extraction utility for archives compressed in .zip format
  lfs # Get information on your mounted disks
  btop # A monitor of system resources
  lm_sensors # Tools for reading hardware sensors
  tldr # Simplified and community-driven man pages
  geekbench # Cross-platform benchmark
  # ajmasia-bin             # Personal scripts (see overlay)
  cava # Console-based Audio Visualizer for Alsa
  pavucontrol # PulseAudio Volume Control

  # CLIs
  telegram-cli # Command-line interface for Telegram
  # protonvpn-cli           # Linux command-line client for ProtonVPN

  # File system management
  ranger # File manager with minimalistic curses interface
  pcmanfm # File manager with GTK interface
  sxiv # Simple X Image Viewer

  # Browsers
  firefox # A web browser built from Firefox source tree
  google-chrome # A freeware web browser developed by Google
  # brave                   # Privacy-oriented browser for Desktop and Laptop computers

  # UI
  feh # A light-weight image viewer
  dmenu # A generic, highly customizable, and efficient menu for the X Window System
  yad # GUI dialog tool for shell scripts
  xdotool # Fake keyboard/mouse input, window management, and more
  xdo # Small X utility to perform elementary actions on windows
  # lxappearance            # Lightweight program for configuring the theme and fonts of gtk applications
  libnotify # A library that sends desktop notifications to a notification daemon


  # Fonts
  nerdfonts # Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts 
  font-awesome # Font Awesome - OTF font

  # Editors
  vscode # Open source source code editor developed by Microsoft for Windows, Linux and macOS 
  obsidian # A powerful knowledge base that works on top of a local folder of plain text Markdown files

  # Code builders, copilers & interpreters
  nodejs-16_x # Node.js interpreter
  yarnWithNode16 # Node.js override with yarn
  python3Full # Python interpreter
  cargo # Rust builder & module manager
  gcc # GNU compiler collection tools
  cmake # Cross-platform, open-source build system generator
  gnumake # Tool to control the generation of non-source files from sources
  ghc # The Glasgow Haskell Compiler

  # Language Servers (LSPs)
  # haskell-language-server
  sumneko-lua-language-server

  # Security
  bitwarden # A secure and free password manager for all of your devices
  bitwarden-cli # A secure and free password manager for all of your devices.

  # _1password-gui          # Multi-platform password manager
  # _1password              # 1Password command-line tool
  # protonvpn-gui           # Official ProtonVPN Linux app

  # Comunications
  tdesktop # Telegram Desktop messaging app
  slack # Desktop client for Slack
  discord # All-in-one cross-platform voice and text chat for gamers

  # Multimedia
  spotify # Play music from the Spotify music service

  # Graphical editors
  inkscape # Vector graphics editor
  gimp # The GNU Image Manipulation Program

  # Servers
  synology-drive-client # Desktop application to synchronize files and folders between the computer and the Synology Drive server

  # Virtualization
  docker-compose # A tool for defining and running multi-container Docker applications

  # Databases
  robo3t # GUI for MongoDB

  # Tools
  etcher # Flash OS images to SD cards and USB drives, safely and easily

  # Testing
  amd-controller
]

