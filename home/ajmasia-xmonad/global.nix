let
  userName = "ajmasia";
  homeDirectory = "/HOME/${userName}";
  configHome = "${homeDirectory}/.config";
in
{
  userName = userName;
  homeDirectory = homeDirectory;
  configHome = configHome;
  walppaper = "wallpaper_004.jpg";
}
