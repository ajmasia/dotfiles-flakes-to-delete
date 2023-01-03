{...}:

{
  programs.xmobar = {
    enable = true;

    extraConfig = builtins.readFile ./configrc; 
  };
}
