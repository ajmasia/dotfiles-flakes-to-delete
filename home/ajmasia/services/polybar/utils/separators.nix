{pkgs, ...}:

let
  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [module/sep-1]
  type = custom/text
  content = " "
  content-font = 1
  content-background = $colors.bg}
  content-foreground = ${colors.alpha}
  
  [module/sep-2]
  type = custom/text
  content = "  "
  content-font = 1
  content-background = $colors.bg}
  content-foreground = ${colors.alpha}
  
  [module/sep-3]
  type = custom/text
  content = "   "
  content-font = 1
  content-background = $colors.bg}
  content-foreground = ${colors.alpha}
  
  [module/sep-4]
  type = custom/text
  content = "    "
  content-font = 1
  content-background = $colors.bg}
  content-foreground = ${colors.alpha}
  
  [module/sep-5]
  type = custom/text
  content = "     "
  content-font = 1
  content-background = $colors.bg}
  content-foreground = ${colors.alpha}
  
  [module/sep-6]
  type = custom/text
  content = "      "
  content-font = 1
  content-background = $colors.bg}
  content-foreground = ${colors.alpha}
  
  [module/sep-7]
  type = custom/text
  content = "       "
  content-font = 1
  content-background = $colors.bg}
  content-foreground = ${colors.alpha}
  
  [module/sep-8]
  type = custom/text
  content = "        "
  content-font = 1
  content-background = $colors.bg}
  content-foreground = ${colors.alpha}
  
  [module/sep-9]
  type = custom/text
  content = "        "
  content-font = 1
  content-background = $colors.bg}
  content-foreground = ${colors.alpha}
  
  [module/sep-10]
  type = custom/text
  content = "         "
  content-font = 1
  content-background = $colors.bg}
  content-foreground = ${colors.alpha}
''
