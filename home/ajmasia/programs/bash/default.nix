{ ... }:

let
  initExtraConfig = ''
    # Init extra config
    export PATH="$HOME/.local/bin:$PATH"
    PATH=~/.emacs.d/bin:$PATH
  '';

  profileExtraConfig = ''
    # Profile extra config
  '';
in
{
  programs.bash = {
    enable = true;

    initExtra = initExtraConfig;
    profileExtra = profileExtraConfig;

    historyIgnore = [ "ls" "cd" "exit" ];
    shellOptions = [ "histappend" "checkwinsize" "extglob" "globstar" "checkjobs" "autocd" ];

    shellAliases = import ./alias;
  };

}


