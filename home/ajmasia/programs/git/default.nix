{ pkgs, ... }:
let
  HOME_PATH = builtins.getEnv "HOME";

  gitConfig = {
    core = {
      excludesfile = "${HOME_PATH}/.gitignore";
    };

    init = {
      defaultBranch = "main";
    };

    ui = {
      color = true;
    };
  };
in
{
  home.packages = with pkgs.gitAndTools; [
    diff-so-fancy # git diff with colors
    hub # github command-line client
    tig # diff and commit view
  ];

  programs.git = {
    enable = true;

    extraConfig = gitConfig;
    userEmail = "email@antoniomasia.com";
    userName = "Antonio José Masiá";

    ignores = [
      ".dir-locals.el"
      ".projectile"
      "TAGS"
      ".tern-project"
      "tsserver.log"
      "ti-.*.log"
      ".log"
    ];
  };
}
