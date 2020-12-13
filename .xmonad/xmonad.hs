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

import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedScratchpad

import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Grid

import qualified Data.Map        as M

myTerminal      = "gnome-terminal"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myClickJustFocuses :: Bool
myClickJustFocuses = False
myBorderWidth   = 2
myModMask       = mod4Mask

myNormalBorderColor  = "#353a42"
myFocusedBorderColor = "#4bc9ea"

myWorkspaces :: [String]
myWorkspaces = [ "\xf015","\xf121", "\xf07b", "\xf002", "\xf00b", "\xf1e0", "\xf001", "\xf03d", "\xf1de"]

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
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    , ((modm,               xK_d     ), spawn "gnome-terminal -- bash -c 'vifm'")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
	| (i, k) <- zip (XMonad.workspaces conf) [xK_F1 .. xK_F9]
	, (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
	| (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
	, (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster)) ------------------------------ mod + button1:         Set the window to floating mode and move by dragging
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster)) ------------------------------ mod + button2:         Raise the window to the top of the stack
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster)) ------------------------------ mod + button3:         Set the window to floating mode and resize by dragging
    ]

myLayout = avoidStruts (tiled ||| Mirror tiled ||| grid ||| Full)
  where
     -- Put space between windows
     tiled   =  spacing 6 $ Tall nmaster delta ratio
     grid    =  spacing 6 $ Grid
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
     [ className =? "obs"     --> doShift ( myWorkspaces !! 8 )
     , className =? "mpv"     --> doShift ( myWorkspaces !! 7 )
     , className =? "vlc"     --> doShift ( myWorkspaces !! 8 )
     , className =? "Gimp"    --> doShift ( myWorkspaces !! 1 )
     , className =? "vimb"    --> doShift ( myWorkspaces !! 4 )
     , className =? "Gimp"    --> doFloat
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
                        , ppCurrent = xmobarColor "#ECBE7B" "" . wrap "[" "]"
                        , ppHiddenNoWindows = xmobarColor "#c792ea" ""
                        , ppHidden = xmobarColor "#82AAFF" "" . wrap "*" ""
                        , ppTitle   = xmobarColor "#82AAFF"  "" . shorten 60
                        , ppSep =  "<fc=#666666> | </fc>"
                        , ppVisible = xmobarColor "#ECBE7B" ""
                        , ppUrgent  = xmobarColor "red" "yellow"
                        , ppExtras  = [windowCount]
                        }
        }

help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
