{
  enable = true;

  defaultApplications =
    let
      firefox = "firefox.desktop";
      browser = firefox;
      alacritty = "Alacritty.desktop";
      sxiv = "sxiv.desktop";
      zathura = "org.pwmt.zathura.desktop";
    in
    {
      "application/x-extension-htm" = browser;
      "application/x-extension-html" = browser;
      "application/x-extension-shtml" = browser;
      "application/x-extension-xht" = browser;
      "application/x-extension-xhtml" = browser;
      "application/xhtml+xml" = browser;
      "application/pdf" = zathura;

      "image/png" = sxiv;
      "text/html" = browser;

      "x-scheme-handler/chrome" = browser;
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
    };
}
