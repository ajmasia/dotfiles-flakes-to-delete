  -- Base
import XMonad
import System.Directory
import System.IO (hClose, hPutStr, hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

    -- Actions
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.CycleWS (Direction1D(..), moveTo, shiftTo, WSType(..), nextScreen, prevScreen, nextWS, prevWS)
import XMonad.Actions.GridSelect
import XMonad.Actions.MouseResize
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import XMonad.Actions.WindowGo (runOrRaise)
import XMonad.Actions.WithAll (sinkAll, killAll)
import XMonad.Actions.OnScreen
import qualified XMonad.Actions.Search as S

    -- Data
import Data.Char (isSpace, toUpper)
import Data.Maybe (fromJust)
import Data.Monoid
import Data.Maybe (isJust)
import Data.Tree
import qualified Data.Map as M

    -- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.EwmhDesktops  -- for some fullscreen events, also for xcomposite in obs.
import XMonad.Hooks.ManageDocks (avoidStruts, docks, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat, doCenterFloat)
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.WindowSwallowing
import XMonad.Hooks.WorkspaceHistory

    -- Layouts
import XMonad.Layout.Accordion
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spiral
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns

    -- Layouts modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ShowWName
import XMonad.Layout.Simplest
import XMonad.Layout.Spacing
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.WindowNavigation
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

   -- Utilities
import XMonad.Util.Dmenu
import XMonad.Util.EZConfig (additionalKeysP, mkNamedKeymap)
import XMonad.Util.Hacks (windowedFullscreenFixEventHook, javaHack, trayerAboveXmobarEventHook, trayAbovePanelEventHook, trayerPaddingXmobarEventHook, trayPaddingXmobarEventHook, trayPaddingEventHook)
import XMonad.Util.NamedActions
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce

import TomorrowNight

myFont :: String
myFont = "xft:Ubuntu Mono:size=12:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod4Mask        -- Sets modkey to super/windows key

myTerminal :: String
myTerminal = "alacritty"    -- Sets default terminal

myBrowser :: String
myBrowser = "firefox "  -- Sets qutebrowser as browser


myEditor :: String
myEditor = myTerminal ++ "-e lvim"  -- Sets emacs as editor

myBorderWidth :: Dimension
myBorderWidth = 0           -- Sets border width for windows

myNormColor :: String       -- Border color of normal windows
myNormColor   = color08   -- This variable is imported from Colors.THEME

myFocusColor :: String      -- Border color of focused windows
myFocusColor  = color04     -- This variable is imported from Colors.THEME

initialSpacing :: Integer      -- Border color of focused windows
initialSpacing = 0     -- This variable is imported from Colors.THEME

-- mySoundPlayer :: String
-- mySoundPlayer = "ffplay -nodisp -autoexit " -- The program that will play system sounds

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset


-- START startupHook settings
myStartupHook :: X ()
myStartupHook = do
  -- Set Workspace 1 to external monitor solution 1
  -- Focus the second screen.
  screenWorkspace 1 >>= flip whenJust (windows . W.view)
  -- Force the second screen to "misc", e.g. if the first screen already has
  -- the workspace associated the screens will swap workspaces.
  windows (W.greedyView $ myWorkspaces !! 0)
  -- Focus the first screen again.
  screenWorkspace 0 >>= flip whenJust (windows . W.view)

  -- Set Workspace 1 to external monitor solution 2
  -- windows (greedyViewOnScreen 1 $ myWorkspaces !! 0)

  -- spawnOnce (mySoundPlayer ++ startupSound)
  -- spawn "killall conky"   -- kill current conky on each restart
  -- spawn "killall trayer"  -- kill current trayer on each restart

  -- spawnOnce "lxsession"
  -- spawnOnce "picom"
  -- spawnOnce "nm-applet"
  -- spawnOnce "volumeicon"
  -- spawnOnce "notify-log $HOME/.log/notify.log"
  -- spawn "/usr/bin/emacs --daemon" -- emacs daemon for the emacsclient

  -- spawn ("sleep 2 && conky -c $HOME/.config/conky/xmonad/" ++ colorScheme ++ "-01.conkyrc")
  -- spawn ("sleep 2 && trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 " ++ colorTrayer ++ " --height 22")

  -- spawnOnce "xargs xwallpaper --stretch < ~/.cache/wall"
  -- -- spawnOnce "~/.fehbg &"  -- set last saved feh wallpaper
  -- -- spawnOnce "feh --randomize --bg-fill /usr/share/backgrounds/dtos-backgrounds/*"  -- feh set random wallpaper
  -- -- spawnOnce "nitrogen --restore &"   -- if you prefer nitrogen to feh
  -- setWMName "LG3D"
  spawnOnce "systemctl --user restart trayer.service"
  spawnOnce "systemctl --user restart picom.service"
-- END startupHook settings

-- START scratchpad settings
myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm ]
  where
    spawnTerm  = myTerminal ++ " -t scratchpad"
    findTerm   = title =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w
-- END scratchpad settings


-- START layoutHook settings
--Makes setting the spacingRaw simpler to write. The spacingRaw module adds a configurable amount of space around windows.
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Below is a variation of the above except no borders are applied
-- if fewer than two windows. So a single window has no gaps.
mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

-- Defining a bunch of layouts, many that I don't use.
-- limitWindows n sets maximum number of windows displayed for layout.
-- mySpacing n sets the gap size around the windows.
tall     = renamed [Replace "tall"]
           $ limitWindows 5
           $ smartBorders
           $ windowNavigation
           $ subLayout [] (smartBorders Simplest)
           $ mySpacing initialSpacing
           $ ResizableTall 1 (3/100) (1/2) []
monocle  = renamed [Replace "monocle"]
           $ smartBorders
           $ windowNavigation
           $ subLayout [] (smartBorders Simplest)
           $ mySpacing initialSpacing
           $ Full
floats   = renamed [Replace "floats"]
           $ smartBorders
           $ simplestFloat
grid     = renamed [Replace "grid"]
           $ limitWindows 9
           $ smartBorders
           $ windowNavigation
           $ subLayout [] (smartBorders Simplest)
           $ mySpacing initialSpacing
           $ mkToggle (single MIRROR)
           $ Grid (16/10)
spirals  = renamed [Replace "spirals"]
           $ limitWindows 9
           $ smartBorders
           $ windowNavigation
           $ subLayout [] (smartBorders Simplest)
           $ mySpacing' initialSpacing
           $ spiral (6/7)
threeCol = renamed [Replace "threeCol"]
           $ limitWindows 7
           $ smartBorders
           $ windowNavigation
           $ subLayout [] (smartBorders Simplest)
           $ mySpacing initialSpacing
           $ ThreeCol 1 (3/100) (1/2)
threeRow = renamed [Replace "threeRow"]
           $ limitWindows 7
           $ smartBorders
           $ windowNavigation
           $ subLayout [] (smartBorders Simplest)
           $ mySpacing initialSpacing
           $ Mirror
           $ ThreeCol 1 (3/100) (1/2)

-- The layout hook
myLayoutHook = avoidStruts
               $ mouseResize
               $ windowArrange
               $ T.toggleLayouts floats
               $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
  where
    myDefaultLayout = withBorder myBorderWidth tall
                                           ||| noBorders monocle
                                           ||| floats
                                           ||| grid
                                           ||| spirals
                                           ||| threeCol
                                           ||| threeRow
-- START layoutHook settings


-- START workspaces settings
-- Define workspaces
myWorkspaces =
  " <fn=2>\xe163</fn> " : -- comunications
  " <fn=2>\xf013</fn> " : -- settings
  " <fn=2>\xf5fd</fn> " : -- dev
  " <fn=2>\xf120</fn> " : -- terminal
  " <fn=2>\xf233</fn> " : -- services
  " <fn=2>\xf187</fn> " : -- files
  " <fn=2>\xf57d</fn> " : -- browser
  " <fn=2>\xf53f</fn> " : -- design
  " <fn=2>\xf025</fn> " : -- audio
  []

-- Get worksapces index
myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..]

-- Make workspaces clickables
clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>"
  where i = fromJust $ M.lookup ws myWorkspaceIndices
-- END workspaces settings


-- START manageHook settings
myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
  -- 'doFloat' forces a window to float.  Useful for dialog boxes and such.
  -- using 'doShift ( myWorkspaces !! 7)' sends program to workspace 8!
  -- I'm doing it this way because otherwise I would have to write out the full
  -- name of my workspaces and the names would be very long if using clickable workspaces.
  [ className =?  ".blueman-manager-wrapped"              --> doCenterFloat
  , className =?  "Bitwarden"                             --> doCenterFloat
  , className =?  ".protonvpn-wrapped"                    --> doCenterFloat
  , className =?  "confirm"                               --> doFloat
  , className =?  "file_progress"                         --> doFloat
  , className =?  "dialog"                                --> doFloat
  , className =?  "download"                              --> doFloat
  , className =?  "error"                                 --> doFloat
  , className =?  "notification"                          --> doFloat
  , className =?  "toolbar"                               --> doFloat
  , className =?  "Yad"                                   --> doCenterFloat
  , className =?  "Google-chrome"                         --> doShift ( myWorkspaces !! 6 )
  , className =?  "VirtualBox Manager"                    --> doShift ( myWorkspaces !! 4 )
  , title     =?  "Mozilla Firefox"                       --> doShift ( myWorkspaces !! 6 )
  , className =?  "TelegramDesktop"                       --> doShift ( myWorkspaces !! 0 )
  , className =?  "Slack"                                 --> doShift ( myWorkspaces !! 0 )
  , className =?  "Pcmanfm"                               --> doShift ( myWorkspaces !! 5 )
  , (className =? "firefox" <&&> resource =? "Dialog")    --> doFloat  -- Float Firefox Dialog
  , isFullscreen -->  doFullFloat
  -- , className =? "gimp"            --> doFloat
  -- , className =? "pinentry-gtk-2"  --> doFloat
  -- , className =? "splash"          --> doFloat
  -- , className =? "VirtualBox Manager"                   --> doShift ( myWorkspaces !! 4 )
  ] <+> namedScratchpadManageHook myScratchPads
-- END manageHook settings


-- soundDir = "/opt/dtos-sounds/" -- The directory that has the sound files
-- startupSound  = soundDir ++ "startup-01.mp3"
-- shutdownSound = soundDir ++ "shutdown-01.mp3"
-- dmenuSound    = soundDir ++ "menu-01.mp3"


-- START keybindings settings
subtitle' ::  String -> ((KeyMask, KeySym), NamedAction)
subtitle' x = ((0,0), NamedAction $ map toUpper
                      $ sep ++ "\n-- " ++ x ++ " --\n" ++ sep)
  where
    sep = replicate (6 + length x) '-'

showKeybindings :: [((KeyMask, KeySym), NamedAction)] -> NamedAction
showKeybindings x = addName "Show Keybindings" $ io $ do
  h <- spawnPipe $ "yad --text-info --fontname=\"SauceCodePro Nerd Font Mono 12\" --fore=#46d9ff back=#282c36 --center --geometry=1200x800 --title \"XMonad keybindings\""
  --hPutStr h (unlines $ showKm x) -- showKM adds ">>" before subtitles
  hPutStr h (unlines $ showKmSimple x) -- showKmSimple doesn't add ">>" to subtitles
  hClose h
  return ()

myKeys :: XConfig l0 -> [((KeyMask, KeySym), NamedAction)]
myKeys c =
  --(subtitle "Custom Keys":) $ mkNamedKeymap c $
  let subKeys str ks = subtitle' str : mkNamedKeymap c ks in
  subKeys "Xmonad Essentials"
  [ ("M-C-r", addName "Recompile XMonad"       $ spawn "xmonad --recompile")
  , ("M-S-r", addName "Restart XMonad"         $ spawn "xmonad --restart")
  -- , ("M-S-q", addName "Quit XMonad"            $ sequence_ [spawn (mySoundPlayer ++ shutdownSound), io exitSuccess])
  , ("M-S-q", addName "Quit XMonad"            $ sequence_ [io exitSuccess])
  , ("M-w",   addName "Kill focused window"    $ kill1)
  , ("M-S-a", addName "Kill all windows on WS" $ killAll)
  -- , ("M-S-<Return>", addName "Run prompt"      $ sequence_ [spawn (mySoundPlayer ++ dmenuSound), spawn "~/.local/bin/dm-run"])
  , ("M-S-b", addName "Toggle bar show/hide"   $ sendMessage ToggleStruts)
  , ("M-/",   addName "Toggle Rofi"                $ spawn "rofi -show drun &")]

  ^++^ subKeys "Switch to workspace"
  [ ("M-1",   addName "Switch to workspace 1"    $ (windows $ W.greedyView $ myWorkspaces !! 0))
  , ("M-2",   addName "Switch to workspace 2"    $ (windows $ W.greedyView $ myWorkspaces !! 1))
  , ("M-3", addName "Switch to workspace 3"    $ (windows $ W.greedyView $ myWorkspaces !! 2))
  , ("M-4", addName "Switch to workspace 4"    $ (windows $ W.greedyView $ myWorkspaces !! 3))
  , ("M-5", addName "Switch to workspace 5"    $ (windows $ W.greedyView $ myWorkspaces !! 4))
  , ("M-6", addName "Switch to workspace 6"    $ (windows $ W.greedyView $ myWorkspaces !! 5))
  , ("M-7", addName "Switch to workspace 7"    $ (windows $ W.greedyView $ myWorkspaces !! 6))
  , ("M-8", addName "Switch to workspace 8"    $ (windows $ W.greedyView $ myWorkspaces !! 7))
  , ("M-9", addName "Switch to workspace 9"    $ (windows $ W.greedyView $ myWorkspaces !! 8))]

  ^++^ subKeys "Send window to workspace"
  [ ("M-S-1", addName "Send to workspace 1"    $ (windows $ W.shift $ myWorkspaces !! 0))
  , ("M-S-2", addName "Send to workspace 2"    $ (windows $ W.shift $ myWorkspaces !! 1))
  , ("M-S-3", addName "Send to workspace 3"    $ (windows $ W.shift $ myWorkspaces !! 2))
  , ("M-S-4", addName "Send to workspace 4"    $ (windows $ W.shift $ myWorkspaces !! 3))
  , ("M-S-5", addName "Send to workspace 5"    $ (windows $ W.shift $ myWorkspaces !! 4))
  , ("M-S-6", addName "Send to workspace 6"    $ (windows $ W.shift $ myWorkspaces !! 5))
  , ("M-S-7", addName "Send to workspace 7"    $ (windows $ W.shift $ myWorkspaces !! 6))
  , ("M-S-8", addName "Send to workspace 8"    $ (windows $ W.shift $ myWorkspaces !! 7))
  , ("M-S-9", addName "Send to workspace 9"    $ (windows $ W.shift $ myWorkspaces !! 8))]


  ^++^ subKeys "Go to next workspace"
  [ ("M-<Right>", addName "Go to next workspace"    $ nextWS)
  , ("M-<Left>", addName "Go to prev workspace "    $ prevWS)]

  ^++^ subKeys "Move window to WS and go there"
  [ ("M-S-<Right>", addName "Move window to next WS"   $ shiftTo Next nonNSP >> moveTo Next nonNSP)
  , ("M-S-<Left>", addName "Move window to prev WS" $ shiftTo Prev nonNSP >> moveTo Prev nonNSP)]

  ^++^ subKeys "Window navigation"
  [ ("M-j", addName "Move focus to next window"                $ windows W.focusDown)
  , ("M-k", addName "Move focus to prev window"                $ windows W.focusUp)
  , ("M-m", addName "Move focus to master window"              $ windows W.focusMaster)
  , ("M-S-j", addName "Swap focused window with next window"   $ windows W.swapDown)
  , ("M-S-k", addName "Swap focused window with prev window"   $ windows W.swapUp)
  , ("M-S-m", addName "Swap focused window with master window" $ windows W.swapMaster)
  , ("M-<Backspace>", addName "Move focused window to master"  $ promote)
  , ("M-S-,", addName "Rotate all windows except master"       $ rotSlavesDown)
  , ("M-S-.", addName "Rotate all windows current stack"       $ rotAllDown)]

  ^++^ subKeys "Favorite programs"
  [ ("M-<Return>", addName "Launch terminal"   $ spawn (myTerminal))
  , ("M-M1-h", addName "Launch htop"           $ spawn (myTerminal ++ " -e htop"))]

  ^++^ subKeys "Monitors"
  [ ("M-.", addName "Switch focus to next monitor" $ nextScreen)
  , ("M-,", addName "Switch focus to prev monitor" $ prevScreen)]

  -- Switch layouts
  ^++^ subKeys "Switch layouts"
  [ ("M-<Tab>", addName "Switch to next layout"   $ sendMessage NextLayout)
  , ("M-<Space>", addName "Toggle noborders/full" $ sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts)
  , ("M-M1-0", addName "Toggle noborders/full" $ sendMessage (MT.Toggle NOBORDERS))]

  -- Window resizing
  ^++^ subKeys "Window resizing"
  [ ("M-h", addName "Shrink window"               $ sendMessage Shrink)
  , ("M-l", addName "Expand windw"               $ sendMessage Expand)
  , ("M-M1-j", addName "Shrink window vertically" $ sendMessage MirrorShrink)
  , ("M-M1-k", addName "Expand window vertically" $ sendMessage MirrorExpand)]

  -- Floating windows
  ^++^ subKeys "Floating windows"
  [ ("M-m", addName "Toggle float layout"        $ sendMessage (T.Toggle "FULL"))
  , ("M-f", addName "Toggle float layout"        $ sendMessage (T.Toggle "floats"))
  , ("M-t", addName "Sink a floating window"     $ withFocused $ windows . W.sink)
  , ("M-S-t", addName "Sink all floated windows" $ sinkAll)]

  -- Increase/decrease spacing (gaps)
  ^++^ subKeys "Window spacing (gaps)"
  [ ("C-M1-j", addName "Decrease window spacing" $ decWindowSpacing 2)
  , ("C-M1-k", addName "Increase window spacing" $ incWindowSpacing 2)
  , ("C-M1-h", addName "Decrease screen spacing" $ decScreenSpacing 2)
  , ("C-M1-l", addName "Increase screen spacing" $ incScreenSpacing 2)]

  -- Increase/decrease windows in the master pane or the stack
  ^++^ subKeys "Increase/decrease windows in master pane or the stack"
  [ ("M-S-<Up>", addName "Increase clients in master pane"   $ sendMessage (IncMasterN 1))
  , ("M-S-<Down>", addName "Decrease clients in master pane" $ sendMessage (IncMasterN (-1)))
  , ("M-=", addName "Increase max # of windows for layout"   $ increaseLimit)
  , ("M--", addName "Decrease max # of windows for layout"   $ decreaseLimit)]

  -- Sublayouts
  -- This is used to push windows to tabbed sublayouts, or pull them out of it.
  ^++^ subKeys "Sublayouts"
  [ ("M-C-h", addName "pullGroup L"           $ sendMessage $ pullGroup L)
  , ("M-C-l", addName "pullGroup R"           $ sendMessage $ pullGroup R)
  , ("M-C-k", addName "pullGroup U"           $ sendMessage $ pullGroup U)
  , ("M-C-j", addName "pullGroup D"           $ sendMessage $ pullGroup D)
  , ("M-C-m", addName "MergeAll"              $ withFocused (sendMessage . MergeAll))
  -- , ("M-C-u", addName "UnMerge"               $ withFocused (sendMessage . UnMerge))
  , ("M-C-/", addName "UnMergeAll"            $  withFocused (sendMessage . UnMergeAll))
  , ("M-C-.", addName "Switch focus next tab" $  onGroup W.focusUp')
  , ("M-C-,", addName "Switch focus prev tab" $  onGroup W.focusDown')]

  -- Scratchpads
  -- Toggle show/hide these programs. They run on a hidden workspace.
  -- When you toggle them to show, it brings them to current workspace.
  -- Toggle them to hide and it sends them back to hidden workspace (NSP).
  ^++^ subKeys "Scratchpads"
  [ ("M-S-l", addName "Toggle scratchpad terminal"   $ namedScratchpadAction myScratchPads "terminal") ]

  -- Controls for mocp music player (SUPER-u followed by a key)
  -- ^++^ subKeys "Mocp music player"
  -- [ ("M-u p", addName "mocp play"                $ spawn "mocp --play")
  -- , ("M-u l", addName "mocp next"                $ spawn "mocp --next")
  -- , ("M-u h", addName "mocp prev"                $ spawn "mocp --previous")
  -- , ("M-u <Space>", addName "mocp toggle pause"  $ spawn "mocp --toggle-pause")]

  -- -- Multimedia Keys
  -- ^++^ subKeys "Multimedia keys"
  -- [ ("<XF86AudioPlay>", addName "mocp play"           $ spawn "mocp --play")
  -- , ("<XF86AudioPrev>", addName "mocp next"           $ spawn "mocp --previous")
  -- , ("<XF86AudioNext>", addName "mocp prev"           $ spawn "mocp --next")
  -- , ("<XF86AudioMute>", addName "Toggle audio mute"   $ spawn "amixer set Master toggle")
  -- , ("<XF86AudioLowerVolume>", addName "Lower vol"    $ spawn "amixer set Master 5%- unmute")
  -- , ("<XF86AudioRaiseVolume>", addName "Raise vol"    $ spawn "amixer set Master 5%+ unmute")
  -- , ("<XF86HomePage>", addName "Open home page"       $ spawn (myBrowser ++ " https://www.youtube.com/c/DistroTube"))
  -- , ("<XF86Search>", addName "Web search (dmscripts)" $ spawn "dm-websearch")
  -- , ("<XF86Mail>", addName "Email client"             $ runOrRaise "thunderbird" (resource =? "thunderbird"))
  -- , ("<XF86Calculator>", addName "Calculator"         $ runOrRaise "qalculate-gtk" (resource =? "qalculate-gtk"))
  -- , ("<XF86Eject>", addName "Eject /dev/cdrom"        $ spawn "eject /dev/cdrom")
  -- , ("<Print>", addName "Take screenshot (dmscripts)" $ spawn "dm-maim")
  -- ]
  -- The following lines are needed for named scratchpads.
    where nonNSP          = WSIs (return (\ws -> W.tag ws /= "NSP"))
          nonEmptyNonNSP  = WSIs (return (\ws -> isJust (W.stack ws) && W.tag ws /= "NSP"))
-- START keybindings settings

-- START main config
myEventHooks = trayerAboveXmobarEventHook <> windowedFullscreenFixEventHook <> trayerPaddingXmobarEventHook

main :: IO ()
main = do
  -- Launching three instances of xmobar on their monitors.
  xmproc0 <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/.xmobarrc"
  -- the xmonad, ya know...what the WM is named after!
  xmonad $ addDescrKeys' ((mod4Mask, xK_F1), showKeybindings) myKeys $ ewmh $ docks $ def
    { manageHook         = myManageHook <+> manageDocks
    , handleEventHook    = windowedFullscreenFixEventHook <> swallowEventHook (className =? "Alacritty"  <||> className =? "st-256color" <||> className =? "XTerm") (return True) <> myEventHooks
    , modMask            = myModMask
    , terminal           = myTerminal
    , startupHook        = myStartupHook
    , layoutHook         = myLayoutHook
    , workspaces         = myWorkspaces
    , borderWidth        = myBorderWidth
    , normalBorderColor  = myNormColor
    , focusedBorderColor = myFocusColor
    , logHook = dynamicLogWithPP $  filterOutWsPP [scratchpadWorkspaceTag] $ xmobarPP
        { ppOutput = \x -> hPutStrLn xmproc0 x   -- xmobar on main monitor
        , ppCurrent = xmobarColor color06 ""
          -- Visible but not current workspace
        , ppVisible = xmobarColor color06 "" . clickable
          -- Hidden workspace
        , ppHidden = xmobarColor color04 "" . clickable
          -- Hidden workspaces (no windows)
        , ppHiddenNoWindows = xmobarColor color05 ""  . clickable
          -- Title of active window
        , ppTitle = (\w -> if null w then "" else "<fc="++color04++"><fn=2>\xf2d0</fn></fc>  " ++ w) . shorten 60
        , ppLayout = (\l -> if null l then "" else "<fc="++color04++"><fn=2>\xf2d2</fn>  " ++ l ++ "</fc>")
          -- Separator character
        , ppSep =  "<fc=" ++ color09 ++ ">      </fc>"
          -- Urgent workspace
        , ppUrgent = xmobarColor color02 "" . wrap "!" "!"
          -- Adding # of windows on current workspace to the bar
        , ppExtras  = [windowCount] 
          -- order of things in xmobar
        , ppOrder  = \(ws:l:t:ex) -> [ws] ++ [l]
        }
    }
-- END main config
