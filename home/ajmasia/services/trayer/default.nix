{ ... }:

{
  services.trayer = {
    enable = false;

    settings = {
      monitor = "primary";
      widthtype = "request";

      distancefrom = "top";
      distance = 4;
      align = "right";
      edge = "top";
      iconspacing = 4;

      margin = 280;

      transparent = true;
      alpha = 0;
      tint = "0x282c34";
    };
  };
}
