{ ... }:

# TODO: simplify this, it is very complex.
let
  palette = import ./colors-palette.nix;
in
{
  ac = "#d26273";
  bg = "#24283B";
  fg = "#ECEFF4";
  mb = "#0a0a0a";
  mf = "#fdd835";
  mgf = "#0a0a0a";

  bd = "#e53935";
  be = "#dc404040";
  bf = "#43a047";
  bi = "#dc404040";
  bm = "#fdd835";
  bn = "#43a047";

  alpha = palette.base.alpha;

  base = {
    amber = "#FFB300";
    black = palette.base.black;
    blue = "#1E88E5";
    blue-gray = "#546E7A";
    brown = "#6D4C41";
    cyan = "#00ACC1";
    deep-orange = "#F4511E";
    deep-purple = palette.deep-purple.dpshade4;
    green = "#43A047";
    grey = palette.grey.greshade4;
    indigo = "#3949AB";
    light-blue = "#039BE5";
    light-green = "#7CB342";
    lime = "#C0CA33";
    orange = "#FB8C00";
    pink = palette.pink.pishade4;
    purple = palette.purple.prshade4;
    red = palette.red.reshade4;
    teal = "#00897B";
    white = palette.base.white;
    yellow = palette.amber.amshade6;
    nixos-primary = "#4C6DB3";
    nixos-secondary = "#7AACD7";
    docker = "#2497ED";

  };
}
