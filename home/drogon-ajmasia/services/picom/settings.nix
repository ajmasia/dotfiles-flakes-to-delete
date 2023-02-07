{
  # Animations
  transition-pow-x = 0.1;
  transition-pow-y = 0.1;
  transition-pow-w = 0.1;
  transition-pow-h = 0.1;
  size-transition = true;
  spawn-center-screen = true;

  # Extra opacity
  frame-opacity = 0.88;
  inactive-opacity-override = false;
  detect-client-opacity = true;

  # Focus 
  mark-wmwin-focused = true;
  mark-ovredir-focused = false;
  detect-transient = true;

  # Windows corner
  detect-rounded-corners = true;
  corner-radius = 8;
  round-borders = 1;
  rounded-corners-exclude = [
    "window_type = 'dock'"
  ];

  # General
  refresh-rate = 0;
  use-damage = false;
  log-level = "warn";
}
