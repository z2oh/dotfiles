import qualified Data.Map as M

import XMonad
import XMonad.Actions.Navigation2D
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Paste

import qualified XMonad.StackSet as W

import System.IO
import System.Exit ( exitSuccess )

main :: IO ()
main = do
    xmonad $ docks defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , normalBorderColor = "#2c2c2c"
        , focusedBorderColor = "#2c2c2c"
        , borderWidth = 1
        , focusFollowsMouse = True
        , keys = myKeys
        , terminal = myTerminal
        , modMask = myModMask
        , startupHook = myStartupHook
        }

myTerminal :: String
myTerminal = "konsole"

myModMask :: KeyMask
myModMask = mod1Mask

myStartupHook = do
    spawn "sh $HOME/.config/polybar/launch.sh"

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@XConfig { XMonad.modMask = modm} = M.fromList $
    [
    -- Launch terminal
      ((modm, xK_Return), spawn $ XMonad.terminal conf)
    -- Launch dmenu
    , ((modm, xK_p), spawn "dmenu_run")
    -- Lock screen
    , ((modm, xK_l), spawn "slock")
    -- Close focused window
    , ((modm, xK_x), kill)
    -- Launch firefox
    , ((modm, xK_w), spawn "firefox")
    -- Recompile and restart xmonad
    , ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q), io exitSuccess)
    -- Cycle through the layout options
    , ((modm, xK_space), sendMessage NextLayout)
    -- Move focus
    , ((modm, xK_r), windowGo L False)
    , ((modm, xK_s), windowGo D False)
    , ((modm, xK_f), windowGo U False)
    , ((modm, xK_t), windowGo R False)
    , ((modm, xK_Tab), windows W.focusDown)
    -- Moving windows
    , ((modm .|. shiftMask, xK_f), windows W.swapDown)
    , ((modm .|. shiftMask, xK_s), windows W.swapUp)
    -- Shrink and expand windows
    , ((modm, xK_d), sendMessage Shrink)
    , ((modm, xK_h), sendMessage Expand)--
    , ((modm, xK_z), withFocused $ windows . W.sink)
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) $ [xK_1 .. xK_9] ++ [xK_0]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]


