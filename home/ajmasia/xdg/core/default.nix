let
  configHome = (import ../../global.nix).configHome;
in
{
  xdg = {
    inherit configHome;

    enable = true;

    desktopEntries = import ../desktop;
    # TODO: import mime config

    configFile = {
      "ranger" = {
        recursive = true;
        source = ./ranger;
      };

      "sxiv" = {
        recursive = true;
        source = ./sxiv;
      };
    };
  };
}

