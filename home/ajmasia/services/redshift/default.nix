{ ... }:

{
  services.redshift = {
    enable = true;

    settings = {
      redshift.brightness-day = 1;
      redshift.brightness-night = 0.8;
    };

    latitude = "36";
    longitude = "-6";

    temperature = {
      day = 7700;
      night = 3700;
    };

    tray = false;
  };
}

