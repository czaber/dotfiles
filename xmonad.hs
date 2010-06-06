{- xmonad.hs
 - Author: Øyvind 'Mr.Elendig' Heggstad <mrelendig AT har-ikkje DOT net>
 - Version: 0.0.9
 -}

-------------------------------------------------------------------------------
-- Imports --
-- stuff
import XMonad

import qualified XMonad.Actions.WindowBringer as B
import qualified XMonad.StackSet as W
import qualified Data.Map as M

import Graphics.X11.Xlib
import IO (Handle, hPutStrLn) 

-- utils
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.Dmenu

-- prompt
import XMonad.Prompt
import XMonad.Prompt.Shell

-- hooks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook

-- layouts
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.Minimize
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion

import XMonad.Layout.ShowWName
-------------------------------------------------------------------------------
-- Main --
main = do
       h <- spawnPipe "xmobar"
--       h <- spawnPipe customDzen
       xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
              { workspaces = workspaces'
              , modMask = modMask'
              , borderWidth = borderWidth'
              , normalBorderColor = normalBorderColor'
              , focusedBorderColor = focusedBorderColor'
              , terminal = terminal'
              , keys = keys'
              , logHook = logHook' h 
              , manageHook = manageHook'
              , layoutHook = layoutHook'
              , startupHook = startupHook'
              }

-------------------------------------------------------------------------------
-- Hooks --

manageHook' :: ManageHook
manageHook' = composeAll [
                className =? "Gimp" --> (ask >>= doF . W.sink)
-- Eclipse's rules
              , className =? "." --> doCenterFloat
              , className =? "Eclipse" --> doShift "3.dev"
              , stringProperty "WM_ICON_NAME" =? "Progress Information " --> doCenterFloat
              ] <+> (doF W.swapDown) <+> manageHook defaultConfig <+> manageDocks

logHook' :: Handle ->  X ()
logHook' h = dynamicLogWithPP $ customPP { ppOutput = hPutStrLn h }

layoutHook' = customLayout
startupHook' = setWMName "LG3D"

-------------------------------------------------------------------------------
-- Looks --
-- bar
customPP :: PP

-- xmobar --
customPP = defaultPP { ppCurrent = xmobarColor "#ffffff" "#b0230d"
                     , ppTitle = xmobarColor "#111111" "" . shorten 30
                     , ppSep =  "<fc=#888888> :: </fc>"
                     , ppHidden = xmobarColor "#444444" ""
                     , ppHiddenNoWindows = xmobarColor "#aaaaaa" ""
                     , ppVisible = xmobarColor "#ffffff" ""
                     , ppUrgent = xmobarColor "#ff0000" "" . wrap "*" ""
                     , ppLayout = (\x -> case x of 
                        "Spacing 4 Spiral" -> "@"
                        "Spacing 4 ResizableTall" -> "$"
                        "Spacing 4 Full" -> "#"
                        "Spacing 2 IM ReflectX IM Full" -> "G"
                        otherwise -> x
                        )
                     }
-- Dzen config
customDzen = "dzen2 -h 20 -ta l -bg \"#252525\" -fn xft:Sans:size=9"

dzenCustomPP = defaultPP { ppCurrent = wrap ("^fg(#ffffff)^bg(#252525)^p()") "^fg()^bg()^p()" . \wsId -> dropIx wsId
                     , ppVisible = wrap ("^fg(#ffffff)^bg(#252525)^p()") "^fg()^bg()^p()" . \wsId -> dropIx wsId
                     , ppHidden  = wrap ("^fg(#888888)^bg(#252525)^p()") "^fg()^bg()^p()" . \wsId -> dropIx wsId
                     , ppHiddenNoWindows  = wrap ("^fg(#555555)^bg(#252525)^p()") "^fg()^bg()^p()" . \wsId -> dropIx wsId
                     , ppUrgent = wrap ("^fg(#dd0000)^bg(#252525)^p()^i(.dzen/icons/plus.xbm)") "^fg()^bg()^p()" . \wsId -> dropIx wsId
                     , ppSep = " :: "
                     , ppWsSep = " "
                     , ppTitle = dzenColor ("#ffffff") ""
                     , ppLayout = (\x -> case x of 
                        "Spacing 4 Spiral" -> "^i(.dzen/icons/mtall.xbm)"
                        "Spacing 4 ResizableTall" -> "^i(.dzen/icons/tall.xbm)"
                        "Spacing 4 Full" -> "^i(.dzen/icons/full.xbm)"
                        "Spacing 2 IM ReflectX IM Full" -> "G"
                        otherwise -> x)
    } where
        dropIx wsId = if (':' `elem` wsId) then drop 2 wsId else wsId

-- shell
customXPConfig = defaultXPConfig { position = Bottom
                      , promptBorderWidth = 0
                      , font = "xft:Sans:size=9"
                      , height = 20 
                      , bgColor  = "#252525"
                      , fgColor  = "#ffffff"
                      , fgHLight = "#b0230d"
                      , bgHLight = "#252525" 
}

-- layouts
--customLayout = onWorkspace "5.gimp" gimp $
--   smartBorders $ spacing 4 $ gaps [(U, 24), (D, 24), (L, 4), (R, 4)] $ (Mirror tiled ||| tiled ||| Full)
--    where
--     tiled = ResizableTall nmaster delta ratio []
--     nmaster = 1
--     delta = 3/100
--     ratio = 3/4
--     gimp = (spacing 2 $ gaps [(U, 24), (D, 24), (L, 4), (R, 4)] $ withIM (0.11) (Role "gimp-toolbox") $ reflectHoriz $ withIM (0.15) (Role "gimp-dock") Full)

customLayout = spacing 4 $ gaps [(U, 24), (D, 24), (L, 4), (R, 4)] $ (ResizableTall 1 0.03 0.75 [] ||| Full)

-- borders
borderWidth' :: Dimension
borderWidth' = 2

normalBorderColor', focusedBorderColor' :: String
normalBorderColor'  = "#111111"
focusedBorderColor' = "#1464E3"

-- workspaces
workspaces' :: [WorkspaceId]
--workspaces' = ["1.main", "2.web", "3.dev", "4.im", "5.gimp", "6", "7", "8", "9"]
workspaces' = [" 1.main ", " 2.web ", " 3.dev ", " 4.im ", " 5.gimp "]

-- indicator
customShowWName = showWName' customSWNConfig
customSWNConfig = defaultSWNConfig { swn_font = "xft:Sans:size=16"
                            , swn_bgcolor = "#111111"
                            , swn_color = "#1464E3"
                            , swn_fade = 1
}
-------------------------------------------------------------------------------
-- Terminal --
terminal' :: String
terminal' = "urxvt"

gotoMenu :: X ()
gotoMenu = B.windowMap >>= actionMenu (windows . W.focusWindow)
 where actionMenu action aMap = dmenuMap aMap >>= flip whenJust action

-------------------------------------------------------------------------------
-- Keys/Button bindings --
-- modmask
modMask' :: KeyMask
modMask' = mod4Mask

-- keys
keys' :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
keys' conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- launching and killing programs
    [ ((modMask,               xK_Return), spawn $ XMonad.terminal conf) 
--    , ((modMask,               xK_p     ), shellPrompt customXPConfig)
    , ((modMask,               xK_p     ), spawn "exe=`dmenu_path | dmenu -i -b -fa 'xft:Dejavu Sans:size=10' -p ':' -nb '#dddddd' -nf '#111111' -sb '#b0230d' -sf '#ffffff'` && eval \"exec $exe\"")
    , ((modMask .|. shiftMask, xK_c     ), kill)

    -- layouts
    , ((modMask,               xK_space ), sendMessage NextLayout)

    -- floating layer stuff
    , ((modMask,               xK_t     ), withFocused $ windows . W.sink)

    -- refresh
    , ((modMask,               xK_n     ), refresh)

    -- focus
    , ((modMask,               xK_Tab   ), windows W.focusDown)
    , ((modMask,               xK_j     ), windows W.focusDown)
    , ((modMask,               xK_k     ), windows W.focusUp)
    , ((modMask,               xK_m     ), windows W.focusMaster)

    -- swapping
    , ((modMask .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- increase or decrease number of windows in the master area
    , ((modMask              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modMask              , xK_period), sendMessage (IncMasterN (-1)))

    -- resizing
    , ((modMask,               xK_h     ), sendMessage Shrink)
    , ((modMask,               xK_l     ), sendMessage Expand)
    , ((modMask .|. shiftMask, xK_h     ), sendMessage MirrorShrink)
    , ((modMask .|. shiftMask, xK_l     ), sendMessage MirrorExpand)

    -- Minimize/Restore windows
    , ((modMask .|. shiftMask, xK_m     ), focusUrgent)

    -- quit, or restart
    , ((modMask              , xK_q     ), restart "xmonad" True)
    ]
    ++
    -- mod-[1..9] %! Switch to workspace N
    -- mod-shift-[1..9] %! Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

-------------------------------------------------------------------------------
