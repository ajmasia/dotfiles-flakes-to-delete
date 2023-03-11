{pkgs, ...}:

let
  tmuxConf = builtins.readFile ./default.conf;
in
{
  programs.tmux = {
    enable = true;

    aggressiveResize = true;
    baseIndex = 1;
    extraConfig = tmuxConf;
    escapeTime = 0;
    keyMode = "vi";
    shortcut = "x";
    terminal = "screen-256color";
  };
}
