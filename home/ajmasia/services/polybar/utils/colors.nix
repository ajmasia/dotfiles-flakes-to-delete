{ ... }:

let
  palette = import ./colors-palette.nix;
in
{
  bg = "#24283B";
  fg = "#ECEFF4";
  ac = "#d26273";
  mb = "#0a0a0a";
  mgf = "#0a0a0a";
  mf = "#fdd835";

  bi = "#dc404040";
  be = "#dc404040";
  bf = "#43a047";
  bn = "#43a047";
  bm = "#fdd835";
  bd = "#e53935";

  base = palette.material;

  alpha = palette.base.alpha;
  white = palette.base.white;
  black = palette.base.black;
}
