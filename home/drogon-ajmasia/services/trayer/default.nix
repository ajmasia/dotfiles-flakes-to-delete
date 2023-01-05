{ ... }:

{
  services.trayer = {
    enable = true;

    settings = {
      monitor = "primary";
      widthtype = "request";

      distancefrom = "top";
      distance = 5;
      align = "right";
      edge = "top";

      height = 24;
      width = 6;
      margin = 10;

      transparent = true;
      alpha = 50;
      tint = "0x282c34";
    };
  };
}
