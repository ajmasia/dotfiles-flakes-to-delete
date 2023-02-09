{pkgs, ...}:

let
  name = "workspaces";
  type = "internal/bspwm";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
[module/${name}]
type = ${type}

# main config
pin-workspaces = true
enable-click = true
enable-scroll = true

# icon-[0-9]+ = <desktop-name>;<icon>
icon-0 = I;
icon-1 = II;
icon-2 = III;
icon-3 = IV;
icon-4 = V;
icon-5 = VI;
icon-6 = VII;
icon-7 = VIII;
icon-8 = IX;
icon-default = 

# format
format = <label-state>
format-font = 3

# labels
label-monitor = %name%

label-active = 
label-active-foreground = ${colors.base.green}
label-active-padding = 1

label-occupied = 
label-occupied-foreground = ${colors.base.cyan}
label-occupied-padding = 1

label-urgent = 
label-urgent-foreground = ${colors.base.red}
label-urgent-padding = 1

label-empty = 
label-empty-foreground = ${colors.base.yellow}
label-empty-padding = 1
''
