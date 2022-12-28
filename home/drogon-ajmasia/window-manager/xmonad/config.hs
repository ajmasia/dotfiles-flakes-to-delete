import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Layout.Spacing      ( spacing )
import XMonad.Layout.Gaps         ( gaps )

-- Main vars
myModMask    = mod4Mask
myTerminal   = "alacritty"
myLauncher  = "rofi -show drun -theme ~/.config/rofi/themes/launcher.rasi &"

-- My layouts
myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1      -- Default number of windows in the master pane
    ratio   = 1/2    -- Default proportion of screen occupied by master pane
    delta   = 3/100  -- Percent of screen to increment by when resizing panes

-- My KeyBindings
myKeyBindings :: [((KeyMask, KeySym), X())]
myKeyBindings =
  [ ((myModMask, xK_e), spawn myLauncher) ]

-- Main config
myConfig = def 
  { modMask            = myModMask     -- Bind Mod to Super key
  , layoutHook         = myLayout     -- Use my custom layouts
  , terminal           = myTerminal   -- Default terminal
  , focusFollowsMouse  = True
  , clickJustFocuses   = False
  , borderWidth        = 2
  , normalBorderColor  = "#dddddd"    -- light gray (default)
  , focusedBorderColor = "#1681f2"    -- blue
  } `additionalKeys` myKeyBindings


main :: IO ()
main = xmonad $ myConfig
