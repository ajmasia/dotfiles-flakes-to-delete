import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.Run(spawnPipe)

import XMonad.Layout.Spacing

import XMonad.Hooks.EwmhDesktops (ewmh)

-- Variables
myModMask    = mod4Mask
myTerminal   = "alacritty"
myLauncher  = "rofi -show drun &"
myBrowser = "firefox"

addGap = smartSpacing 8

-- My layouts
myLayout = addGap $ tiled ||| Mirror tiled ||| Full
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1      -- Default number of windows in the master pane
    ratio   = 1/2    -- Default proportion of screen occupied by master pane
    delta   = 3/100  -- Percent of screen to increment by when resizing panes

-- My KeyBindings
myKeyBindings :: [((KeyMask, KeySym), X())]
myKeyBindings =
  [ ((myModMask, xK_space), spawn myLauncher)
  , ((myModMask .|. controlMask , xK_b), spawn myBrowser)
  ]

-- Main config
myConfig = def 
  { modMask            = myModMask     -- Bind Mod to Super key
  , layoutHook         = myLayout     -- Use my custom layouts
  , terminal           = myTerminal   -- Default terminal
  , focusFollowsMouse  = True
  , clickJustFocuses   = False
  , borderWidth        = 0
  , normalBorderColor  = "#dddddd"    -- light gray (default)
  , focusedBorderColor = "#1681f2"    -- blue
  } `additionalKeys` myKeyBindings


main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar"
  xmonad 
    .ewmh
    $ myConfig
