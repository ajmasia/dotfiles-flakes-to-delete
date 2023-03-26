{ pkgs, inputs, ... }:

let
  unstable = import inputs.unstable {
    system = pkgs.system;
  };
in
{
  home.packages = with pkgs; [
    yubikey-manager     # yubikey manager cli
    unstable.yubioath-flutter    # yubikey OTP manager (gui)
  ];

  xdg.configFile."Yubico/Yubico Authenticator.conf".source = ./authenticator.conf;
}
