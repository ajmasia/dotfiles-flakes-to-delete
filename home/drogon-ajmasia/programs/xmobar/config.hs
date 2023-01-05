-- Xmobar (http://projects.haskell.org/xmobar/)
-- This is one of the xmobar configurations for DTOS.
-- This config is packaged in the DTOS repo as 'dtos-xmobar'
-- Color scheme: Doom One
-- Dependencies: 
   -- otf-font-awesome 
   -- ttf-mononoki 
   -- ttf-ubuntu-font-family
   -- htop
   -- emacs
   -- pacman (Arch Linux)
   -- trayer
   -- 'dtos-local-bin' (from dtos-core-repo)

Config { font            = "Ubuntu Mono 12"
       , additionalFonts = [ "Font Awesome 6 Free Solid 11"
                           , "Font Awesome 6 Free Solid 12"
                           , "Font Awesome 6 Free Solid 14"
                           , "Font Awesome 6 Free Solid 16"
                           , "Font Awesome 6 Free Solid 18"
                           , "Font Awesome 6 Free Solid 20"
                           , "Font Awesome 6 Free Solid 22"
                           , "Font Awesome 6 Brands 12"
                           , "Font Awesome 6 Brands 14"
                           , "Font Awesome 6 Brands 16"
                           , "Font Awesome 6 Brands 18"
                           ]
       , bgColor      = "#282c34"
       , fgColor      = "#ff6c6b"
       , alpha        = 255
       -- Position TopSize and BottomSize take 3 arguments:
       --   an alignment parameter (L/R/C) for Left, Right or Center.
       --   an integer for the percentage width, so 100 would be 100%.
       --   an integer for the minimum pixel height for xmobar, so 24 would force a height of at least 24 pixels.
       --   NOTE: The height should be the same as the trayer (system tray) height.
       , position       = TopSize L 100 36
       , lowerOnStart = True
       , overrideRedirect = True
       , hideOnStart  = False
       , allDesktops  = True
       , persistent   = True
       , iconRoot     = "/home/ajmasia/.xmobar/icons"  -- default: "."
       , commands = [
                    --     -- Echos a "messages" icon in front of the notify-log output.
                    --   Run Com "echo" ["<fn=3>\xf099</fn>"] "messages" 3600
                    --     -- View notify.log file (~/.log/notify-log/notify.log)
                    -- , Run Com "echo" ["View Notifications"]  "notify-log" 3600
                    --     -- Echos a "penguin" icon in front of the kernel output.
                    -- , Run Com "echo" ["<fn=3>\xf17c</fn>"] "penguin" 3600
                    --     -- Get kernel version (script found in .local/bin)
                    -- , Run Com ".local/bin/kernel" [] "kernel" 36000
                        -- Cpu usage in percent
                    Run Cpu ["-t", "<fn=3>\xf2db</fn>  <total>%","-H","50","--high","red"] 20
                    --CPU temp
                    , Run Com "/run/current-system/sw/bin/bash" ["-c","sensors | grep Tctl: | awk '{print $2}'"] "tcpu" 50
                        -- Ram used number and percent
                    , Run Memory ["-t", "<fn=2>\xf233</fn>  <usedratio>%"] 20
                        -- Disk space free
                    , Run DiskU [("/", "<fn=3>\xf0c7</fn>  sys: <free>")
                               , ("/home", "  <fn=3>\xf0c7</fn>  home: <free>")] [] 60
                        -- Echos an "up arrow" icon in front of the uptime output.
                    , Run Com "echo" ["<fn=2>\xf0aa</fn>"] "uparrow" 3600
                        -- Echos an "temp" icon in front of the tcpu output.
                    , Run Com "echo" ["<fn=3>\xf2c8</fn>"] "temperature" 3600
                        -- Echos an "power" icon in front of the power output.
                    , Run Com "echo" ["<fn=3>\xf011</fn>"] "power" 3600
                        -- Uptime
                    , Run Uptime ["-t", "<days>d <hours>h"] 360
                    --     -- Echos a "bell" icon in front of the pacman updates.
                    -- , Run Com "echo" ["<fn=2>\xf0f3</fn>"] "bell" 3600
                    --     -- Check for pacman updates (script found in .local/bin)
                    -- , Run Com ".local/bin/pacupdate" [] "pacupdate" 36000
                    --     -- Echos a "battery" icon in front of the pacman updates.
                    -- , Run Com "echo" ["<fn=2>\xf242</fn>"] "baticon" 3600
                    --     -- Battery
                    -- , Run BatteryP ["BAT0"] ["-t", "<acstatus><watts> (<left>%)"] 360
                        -- Time and date
                    , Run Date "<fn=1>\xf133</fn>  %b %d %Y  <fn=1>\xf017</fn> %H:%M" "date" 50
                    --     -- Script that dynamically adjusts xmobar padding depending on number of trayer icons.
                    -- , Run Com ".config/xmobar/trayer-padding-icon.sh" [] "trayerpad" 20
                        -- Prints out the left side items such as workspaces, layout, etc.
                    , Run UnsafeStdinReader
                    , Run XPropertyLog "_XMONAD_TRAYPAD"
                    ]
       , sepChar ="%"
       , alignSep = "}{"
       -- , template = " %UnsafeStdinReader% }{ <box type=Bottom width=2 mb=2 color=#98be65><fc=#98be65>%messages%  <action=`alacritty -e nvim .log/notify.log`>%notify-log%</action></fc></box>    <box type=Bottom width=2 mb=2 color=#51afef><fc=#51afef>%penguin%  %kernel%</fc></box>    <box type=Bottom width=2 mb=2 color=#ecbe7b><fc=#ecbe7b><action=`alacritty -e htop`>%cpu%</action></fc></box>    <box type=Bottom width=2 mb=2 color=#ff6c6b><fc=#ff6c6b><action=`alacritty -e htop`>%memory%</action></fc></box>    <box type=Bottom width=2 mb=2 color=#a9a1e1><fc=#a9a1e1>%disku%</fc></box>    <box type=Bottom width=2 mb=2 color=#98be65><fc=#98be65>%uparrow%  %uptime%</fc></box>    <box type=Bottom width=2 mb=2 color=#c678dd><fc=#c678dd>%bell%  <action=`alacritty -e sudo pacman -Syu`>%pacupdate%</action></fc></box>   <box type=Bottom width=2 mb=2 color=#da8548><fc=#da8548>%baticon%  %battery%</fc></box>    <box type=Bottom width=2 mb=2 color=#46d9ff><fc=#46d9ff><action=`emacsclient -c -a 'emacs' --eval '(doom/window-maximize-buffer(dt/year-calendar))'`>%date%</action></fc></box> %trayerpad%"
       , template = " %UnsafeStdinReader% }{\
            \<fc=#ecbe7b><action=`alacritty -e htop`>%cpu%</action></fc>    \
            \<fc=#ecbe7b>%temperature%  %tcpu%</fc>    \
            \<fc=#ff6c6b><action=`alacritty -e htop`>%memory%</action></fc>    \
            \<fc=#a9a1e1>%disku%</fc>    \
            \<fc=#98be65>%uparrow%  %uptime%</fc>          \
            \%_XMONAD_TRAYPAD%     <fc=#f8f8f2>%date%</fc>    <fc=#ecbe7b>%power%</fc>  "
       }


