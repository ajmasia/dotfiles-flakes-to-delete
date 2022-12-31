{ homeDirectory, ... }:

let
  configHome = "${homeDirectory}/.config";
in
{
  xdg = {
    inherit configHome;

    enable = true;

    desktopEntries = (import ./desktop) { inherit homeDirectory; };
    # TODO: import mime config
  };
}
