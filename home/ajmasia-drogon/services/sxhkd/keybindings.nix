{
  # Window manager control
  "super + alt + {q,r}" = "bspc {quit, wm -r}";
  "super + Escape" = "pkill -USR1 -x sxhkd";

  # App launchers
  "super + Return" = "alacritty";
  "super + @space" = "rofi -show drun -theme ~/.config/rofi/themes/launcher.rasi &";
  "alt + tab" = "rofi -show window -theme ~/.config/rofi/themes/launcher.rasi &";
  # "super + p" = "rofi -show drun";
  "super + e" = "emojis";
  "super + shift + f" = "flameshot gui";
  "super + shift + l" = "set-slack-status";
  "super + shift + p" = "set-cpu-profile";

  # Windows management
  "super + {_,shift + }w" = "bspc node -{c,k}";
  # alternate between the tiled and monocle layout
  "super + m" = "bspc desktop -l next";
  # send the newest marked node to the newest preselected node
  "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";
  # swap the current node and the biggest window
  "super + g" = "bspc node -s biggest.window";
  # set the window state
  "super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
  # focus or send to the given desktop
  "super + {1-9,0}" = "	bspc desktop -f {I,II,III,IV,V,VI,VII,VIII,IX,X}";
  # send and focus window to prev or next deskt 
  "super + shift + bracket{left,right}" = "bspc node -d {prev,next}.local -f";
  # focus history
  "super + {o,i}" = "bspc wm -h off; bspc node {older,newer} -f;bspc wm -h on;";

  # Desktops management
  "super + {Left,Right}" = "bspc desktop -f {prev,next}.local";

  # Brightness control
  "XF86MonBrightnessUp" = "brightnessctl s +1%";
  "XF86MonBrightnessDown" = "brightnessctl s 1%-";

  # Dunst control
  "super + shift + @space" = "dunstctl close";
  "super + shift + {n,d}" = "{dunstctl history-pop, toogle-dunst-status}";

  # Sound control
  "XF86Audio{Raise,Lower}Volume" = "vol {up,down}";
  "XF86AudioMute" = "vol mute";

  # System management
  "super + alt + p" = "power-menu &";
}
