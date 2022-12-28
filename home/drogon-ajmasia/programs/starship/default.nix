{ ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      add_newline = false;
      line_break = {
        disabled = true;
      };

      aws = {
        disabled = true;
      };

      nix_shell = {
        impure_msg = "i";
        pure_msg = "p";
      };
    };
  };
}
