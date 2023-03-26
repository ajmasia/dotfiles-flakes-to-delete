{ pkgs, ... }:

let
  tmuxConf = builtins.readFile ./default.conf;
  plugins = pkgs.tmuxPlugins;
in
{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    extraConfig = tmuxConf;
    escapeTime = 0;
    keyMode = "vi";
    shortcut = "x";
    terminal = "screen-256color";

    plugins = with plugins; [
      # {
      #   plugin = dracula;
      #   extraConfig = ''
      #   '';
      # }
    ];
  };
}
