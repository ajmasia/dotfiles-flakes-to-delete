{...}:

{
  programs.xmobar = {
    enable = true;

    extraConfig = import ./configrc; 
  };
}
