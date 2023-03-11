import ./commons.nix //
  import ./git.nix //
  import ./docker.nix //

{
  # directories
  # gmo = "cd ~/projects/genially/mono && gsh shell";
  # gdb = "cd ~/projects/genially/dev-databases && gsh shell";
  doc = "cd ~/synologyDrive";

  # vpn
  # gdev-vpn = "sudo openvpn ~/.config/vpn/genially_dev.ovpn";

  # apps 

  # genially project
  # grp = "yarn clean:modules && yarn && gsh cli builder --all";

  # Programs
  calc = "env GTK_THEME=Adwaita ~/.nix-profile/bin/libreoffice --calc &";
  base = "env GTK_THEME=Adwaita ~/.nix-profile/bin/libreoffice --base &";
}
