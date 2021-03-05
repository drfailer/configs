import XMonad
import XMonad.Config.Desktop
import Data.Monoid
import System.Exit
import System.IO
import qualified XMonad.StackSet as W

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName

import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedScratchpad

import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Grid
import XMonad.Layout.SimpleFloat
import XMonad.Layout.NoBorders
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile

import qualified Data.Map        as M

myTerminal      = "gnome-terminal"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myClickJustFocuses :: Bool
myClickJustFocuses = False
myBorderWidth   = 2
myModMask       = mod4Mask

_JAVA_AWT_WM_NONREPARENTING=1
--AWT_TOOLKIT=MToolkit

myNormalBorderColor  = "#282C34"
-- myFocusedBorderColor = "#a9a1e1"
myFocusedBorderColor = "#2257A0"

myWorkspaces :: [String]
myWorkspaces = [ "main","dev", "doc", "www", "buff", "chat", "msc", "vid", "sys"]
-- myWorkspaces = [ "\xf015","\xf121", "\xf07b", "\xf002", "\xf00b", "\xf1e0", "\xf001", "\xf03d", "\xf1de"]

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_p     ), spawn "dmenu_run -p 'Run:'")
    , ((modm .|. shiftMask, xK_p     ), spawn "j4-dmenu-desktop --dmenu='dmenu -p 'Run:''") -- require to install j4-dmenu-desktop
    , ((modm .|. shiftMask, xK_c     ), kill)      
    , ((modm,               xK_space ), sendMessage NextLayout)        
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_n     ), refresh)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp)
    , ((modm,               xK_m     ), windows W.focusMaster)
    , ((modm,               xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm .|. shiftMask, xK_l     ), sendMessage MirrorShrink)
    , ((modm .|. shiftMask, xK_h     ), sendMessage MirrorExpand)

    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_semicolon), sendMessage (IncMasterN (-1)))
    , ((modm,               xK_b     ), sendMessage ToggleStruts)

    -- Spacing: windows and borders
    , ((modm, xK_i), (incWindowSpacing 4))
    , ((modm, xK_u), (decWindowSpacing 4))
    , ((modm .|. shiftMask, xK_i), (incScreenSpacing 4))
    , ((modm .|. shiftMask, xK_u), (decScreenSpacing 4))

    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    , ((modm,               xK_d     ), spawn "gnome-terminal -- bash -c 'ranger'")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_F1 .. xK_F9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_z, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster)) ------------------------------ mod + button1:         Set the window to floating mode and move by dragging
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster)) ------------------------------ mod + button2:         Raise the window to the top of the stack
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster)) ------------------------------ mod + button3:         Set the window to floating mode and resize by dragging
    ]

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

myLayout = avoidStruts (tiled ||| Mirror tiled ||| full ||| float ||| treeCols ||| grid)
  where
     -- Put space between windows
     tiled    =  mySpacing 6 $ ResizableTall nmaster delta ratio []
     treeCols =  mySpacing 6 $ ThreeColMid nmaster delta ratio
     grid     =  mySpacing 6 $ Grid
     float    =  simpleFloat
     full     =  noBorders Full
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
     [ className =? "vlc"     --> doShift ( myWorkspaces !! 8 )
     , className =? "Gimp"    --> doFloat
     , title =? "sxiv"    --> doFloat
     , title =? "Processing Camera" --> doFloat
     , title =? "Discord" --> doShift ( myWorkspaces !! 5 )
     , title =? "emacs@drfailer-System-Product-Name" --> doShift ( myWorkspaces !! 1 )
     , title =? "AnalyseSI v0.80 - Cairns - sans nom" --> doFloat
     , title =? "Oracle VM VirtualBox Manager"     --> doFloat
     , className =? "VirtualBox Manager" --> doShift  ( myWorkspaces !! 4 )
     , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat  -- Float Firefox Dialog
     ]

myEventHook = mempty

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 1.0

myStartupHook = do
  spawnOnce "nitrogen --restore &"
  spawnOnce "compton &"
  spawnOnce "xrandr --output HDMI-0 --primary --left-of DVI-D-0 --output DVI-D-0 --auto"
  spawnOnce "setxkbmap -layout fr -option ctrl:nocaps"
  setWMName "LG3D"

main = do
    xmproc <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarrc"
    xmonad $ docks def
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook desktopConfig                        
        , layoutHook         =  myLayout
        , handleEventHook    = myEventHook
        , startupHook        = myStartupHook
        , terminal           = myTerminal
        , focusFollowsMouse  = myFocusFollowsMouse
        , clickJustFocuses   = myClickJustFocuses
        , borderWidth        = myBorderWidth
        , modMask            = myModMask
        , workspaces         = myWorkspaces
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , keys               = myKeys
        , mouseBindings      = myMouseBindings
        , logHook = myLogHook <+> dynamicLogWithPP xmobarPP 
                        { ppOutput = hPutStrLn xmproc
                        , ppCurrent = xmobarColor "#E5C07B" "" . wrap "[" "]"
                        , ppHiddenNoWindows = xmobarColor "#c792ea" ""
                        , ppHidden = xmobarColor "#82AAFF" "" . wrap "*" ""
                        , ppTitle   = xmobarColor "#a9a1e1"  "" . shorten 30
                        , ppSep =  "<fc=#666666> | </fc>"
                        , ppVisible = xmobarColor "#E5C07B" ""
                        , ppUrgent  = xmobarColor "red" "yellow"
                        , ppExtras  = [windowCount]
                        }
        }
