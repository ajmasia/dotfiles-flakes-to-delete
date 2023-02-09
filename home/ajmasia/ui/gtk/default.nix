{ pkgs, ... }:

{
  gtk = with pkgs; {
    enable = true;

    theme = {
      name = "Nordic";
      package = nordic;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = papirus-icon-theme;
    };

    # cursorTheme = {
    #   name = "capitaine-cursors";
    #   package = capitaine-cursors;
    # };
  };
}

