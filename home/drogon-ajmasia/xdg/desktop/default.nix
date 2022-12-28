{ homeDirectory, ... }:

{
  # Desktop entries
  "com.yubico.authenticator" = {
    comment = "Yubico Authenticator app";
    exec = "authenticator";
    genericName = "Yubico Authenticator";
    icon = homeDirectory + "/.nix-profile/app/linux_support/com.yubico.yubioath.png";
    name = "Yubico Authenticator";
    terminal = false;
    type = "Application";
    categories = [ "Utility" ];
  };
}
