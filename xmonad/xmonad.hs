import qualified Data.Map as M

import XMonad
import XMonad.Actions.Navigation2D
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeInactive
import XMonad.Config.Desktop
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Paste

import qualified XMonad.StackSet as W

import System.IO
import System.Exit ( exitSuccess )

myDzen = "dzen2 -x '0' -y '0' -h '20' -w '1920' -ta 'l' -fg '#FFFFFF' -bg '#1B1D1E' -dock"
myStatusBar = "conky -c /home/jaday/.xmonad/.conky_dzen | dzen2 -x '920' -w '1000' -h '24' -ta 'r' -bg '#1B1D1E' -fg '#FFFFFF' -y '0'"

main :: IO ()
main = do
	dzenLeftBar <- spawnPipe myDzen
	dzenRightBar <- spawnPipe myStatusBar
	xmonad $ desktopConfig
		{ manageHook = manageDocks <+> manageHook desktopConfig
		, layoutHook = avoidStruts $ layoutHook desktopConfig
		, logHook = myLogHook dzenLeftBar
		, normalBorderColor = "#000000"
		, focusedBorderColor = "#323232"
		, focusFollowsMouse = False
		, keys = myKeys
		, terminal = myTerminal
		, modMask = myModMask
		}

myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP
    {
        ppCurrent           =   dzenColor "#ebac54" "#1B1D1E" . pad
      , ppVisible           =   dzenColor "white" "#1B1D1E" . pad
      , ppHidden            =   dzenColor "white" "#1B1D1E" . pad
      , ppHiddenNoWindows   =   dzenColor "#7b7b7b" "#1B1D1E" . pad
      , ppUrgent            =   dzenColor "#ff0000" "#1B1D1E" . pad
      , ppWsSep             =   " "
      , ppSep               =   "  |  "
      , ppLayout            =   dzenColor "#ebac54" "#1B1D1E" .
                                (\x -> case x of
                                    _                           ->      x
                                )
      , ppTitle             =   (" " ++) . dzenColor "white" "#1B1D1E" . dzenEscape
      , ppOutput            =   hPutStrLn h
    }

myTerminal :: String
myTerminal = "termite"

myModMask :: KeyMask
myModMask = mod4Mask

-- Das 4 Extra keys
xK_XF86Sleep       = 0x1008FF2F
xK_XF86Mute        = 0x1008FF12
xK_XF86Back        = 0x1008FF16
xK_XF86Play        = 0x1008FF14
xK_XF86Next        = 0x1008FF17
xK_XF86VolumeLower = 0x1008ff11
xK_XF86VolumeRaise = 0x1008ff13

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@XConfig { XMonad.modMask = modm} = M.fromList $
	[
	-- Launch terminal
	  ((modm, xK_Return), spawn $ XMonad.terminal conf)
	-- Launch dmenu
	, ((modm, xK_p), spawn "dmenu_run")
	-- Close focused window
	, ((modm, xK_x), kill)
	-- Launch google chrome
	, ((modm, xK_w), spawn "google-chrome-stable")
	-- Recompile and restart xmonad
	, ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
	-- Quit xmonad
	, ((modm .|. shiftMask, xK_q), io exitSuccess)
	-- Cycle through the layout options
	, ((modm, xK_space), sendMessage NextLayout)
	-- Change screen brightness
	, ((modm, xK_F5), spawn "python /usr/local/bin/backlight.py -")
	, ((modm, xK_F6), spawn "python /usr/local/bin/backlight.py +")
	, ((modm, xK_F7), spawn "python /usr/local/bin/backlight.py --")
	-- Change screen temperature
	, ((0   , xK_XF86VolumeLower), spawn "python /usr/local/bin/screen_temp.py -")
	, ((0   , xK_XF86VolumeRaise), spawn "python /usr/local/bin/screen_temp.py +")
	-- Change keyboard brightness
	, ((modm, xK_F4), spawn "python /usr/local/bin/kb-light.py +")
	, ((modm, xK_F3), spawn "python /usr/local/bin/kb-light.py -")
	-- Change volume
	, ((modm, xK_F12), spawn "python /usr/local/bin/vol_control.py +")
	, ((modm, xK_F11), spawn "python /usr/local/bin/vol_control.py -")
	, ((modm, xK_F10), spawn "python /usr/local/bin/vol_control.py mute")
	-- Move focus
	, ((modm, xK_r), windowGo L False)
	, ((modm, xK_s), windowGo D False)
	, ((modm, xK_f), windowGo U False)
	, ((modm, xK_t), windowGo R False)
    , ((modm, xK_Tab), windows W.focusDown)
	-- Lock screen
	, ((modm, xK_l), spawn "slock")
    -- Moving windows
    , ((modm .|. shiftMask, xK_u), windows W.swapDown)
    , ((modm .|. shiftMask, xK_e), windows W.swapUp)
    , ((modm, xK_v), windows W.swapMaster)
    -- Return window to tiling
    , ((modm, xK_z), withFocused $ windows . W.sink)
	-- Switch monitor layout
	, ((modm .|. shiftMask, xK_o), spawn "sh ~/.screenlayout/double-monitor-vertical.sh") 
	, ((modm .|. shiftMask, xK_p), spawn "sh ~/.screenlayout/single-monitor.sh")
	-- Shrink and expand windows
	, ((modm, xK_g), sendMessage Shrink)
	, ((modm, xK_j), sendMessage Expand)
	-- Increment and decrement the number of windows in the master area
	, ((modm, xK_comma), sendMessage (IncMasterN 1))
	, ((modm, xK_period), sendMessage (IncMasterN (-1)))
	-- Toggle struts
	, ((modm, xK_b), sendMessage ToggleStruts)
	]
	++
	[((m .|. modm, k), windows $ f i)
		| (i, k) <- zip (XMonad.workspaces conf) $ [xK_1 .. xK_9] ++ [xK_0]
		, (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
