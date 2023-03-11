{ pkgs, inputs, ... }:

let
  unstable = import inputs.unstable {
    system = pkgs.system;
  };
in
{
  programs.starship = {
    enable = true;

    package = unstable.starship;
    enableBashIntegration = true;

    settings = {
      add_newline = false;

      format = "$os$all";

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };

      os = {
        disabled = false;
        style = "bold fg:#7AACD7";
        symbols = {
          NixOS = " ";
        };
      };

      username = {
        disabled = true;
        style_user = "green";
        style_root = "red";
        format = "\\[[$user]($style)";
        show_always = true;
      };

      hostname = {
        disabled = true;
        style = "green";
        format = "[@](white)[$hostname]($style)\\] ";
        ssh_only = false;
      };

      line_break = {
        disabled = true;
      };

      aws = {
        disabled = true;
      };

      nodejs = {
        format = "[ $version]($style) ";
        style = "bold green";
      };

      nix_shell = {
        impure_msg = "[impure](red)";
        pure_msg = "[pure](green)";
        format = "on [$state (\\($name\\))shell]($style) ";
        style = "bold fg:#7AACD7";
      };

      git_branch = {
        symbol = "[]($style) ";
      };

      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
      };

      lua = {
        format = "[$symbol $version]($style) ";
        style = "bold blue";
        symbol = "󰢱";
      };
    };

  };
}
