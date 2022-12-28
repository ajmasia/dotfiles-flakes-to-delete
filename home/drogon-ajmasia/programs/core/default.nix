{ pkgs, ... }:

{
  programs = {
    # A user environment configurator
    home-manager = {
      enable = true;
    };

    #  A cat clone with syntax highlighting and Git integration. 
    bat = {
      enable = true;
    };

    # An interactive tree view, a fuzzy search, a balanced BFS descent and customizable commands
    broot = {
      enable = true;

      enableBashIntegration = true;
    };

    # A shell extension that manages your environment
    direnv = {
      enable = true;

      nix-direnv.enable = true;
    };

    # A command-line fuzzy finder written in Go
    fzf = {
      enable = true;

      enableFishIntegration = true;
      defaultCommand = "fd --type file --follow"; # FZF_DEFAULT_COMMAND
      defaultOptions = [ "--height 20%" ]; # FZF_DEFAULT_OPTS
      fileWidgetCommand = "fd --type file --follow"; # FZF_CTRL_T_COMMAND
    };

    # A lightweight and flexible command-line JSON processor
    jq = {
      enable = true;
    };

    # An interactive process viewer
    htop = {
      enable = true;

      settings = {
        sort_direction = true;
        sort_key = "PERCENT_CPU";
      };
    };
  };
}

