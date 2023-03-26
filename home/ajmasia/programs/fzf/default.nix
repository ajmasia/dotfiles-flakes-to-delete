{ pkgs, inputs, ... }:

let
  unstablePackages = import inputs.unstable { 
    system = pkgs.system;
  };
in
{
  programs.fzf = {
    enable = true;

    package = unstablePackages.fzf;
    enableBashIntegration = true;
  };
}

