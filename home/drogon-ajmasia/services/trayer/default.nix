{ ... }:

{
  services.trayer = {
    enable = true;

    settings = {
      monitor = "primary";
      widthtype = "request";

      distancefrom = "top";
      distance = 4;
      align = "right";
      edge = "top";
      iconspacing = 4;

      margin = 260;

      transparent = true;
      alpha = 0;
      tint = "0x282c34";
    };
  };
}
