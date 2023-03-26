let
  homeDirectory = (import ../../global.nix).homeDirectory;
in
{
  # Desktop entries
  "com.yubico.authenticator" = {
    comment = "Yubico Authenticator app";
    exec = "yubioath-flutter";
    genericName = "Yubico Authenticator";
    icon = homeDirectory + "/.nix-profile/share/icons/com.yubico.yubioath.png";
    name = "Yubico Authenticator";
    terminal = false;
    type = "Application";
    categories = [ "Utility" ];
  };

  "bazecor" = {
    comment = "Bazecor Dygma app";
    exec = "Bazecor";
    genericName = "Yubico Authenticator";
    icon = homeDirectory + "/.local/share/desktop-icons/bazecor.png";
    name = "Bazecor";
    terminal = false;
    type = "Application";
    categories = [ "Utility" ];
  };
}
