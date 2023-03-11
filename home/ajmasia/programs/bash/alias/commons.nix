{
  # Edit system and user configs
  # hme = "lvim ~/.config/nixpkgs";
  # sce = "lvim /etc/nixos/configuration.nix";
   
  # Switch configurations
  # hms = "home-manager switch";
  # scw = "sudo nixos-rebuild switch";

  # Shell
  c = "clear";
  cat = "bat";
  ls = "exa";
  tree = "l --tree --color=always";
  gtree = "tree -l --git | less -r";
  sb = "for i in $(seq 1 10); do time zsh -i -c exit; done";
  vim = "nvim";
  hm = "home-manager";

  swd = "cd $(find ~/ -type d -print | fzf)";

  # mdisk = "udisksctl mount -b /dev/disk/by-label/$(ls /dev/disk/by-label | fzf | awk -F'->' '{print $1}')";
  # udisk = "udisksctl unmount -b /dev/disk/by-label/$(ls /dev/disk/by-label | fzf | awk -F'->' '{print $1}')";
}


