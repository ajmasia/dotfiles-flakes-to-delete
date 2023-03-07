{ pkgs, ... }:

{
  gtk = with pkgs; {
    enable = true;

    theme = {
      name = "Nordic";
      package = nordic;
    };

    iconTheme = {
      name = "Numix-Circle";
      package = numix-icon-theme-circle;

      # name = "Papirus-Dark";
      # package = papirus-icon-theme;
    };

    # cursorTheme = {
    #   name = "capitaine-cursors";
    #   package = capitaine-cursors;
    # };
  };
}

