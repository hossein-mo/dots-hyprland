hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), {description = "Edit user keybinds"} )

local qsIpcCall = "qs -c $qsConfig ipc call"
local qsIsAlive = qsIpcCall .. " TEST_ALIVE"
local hyprScripts = "$HOME/.config/hypr/hyprland/scripts"

--##! Disable workspace navigation that was commented out in upstream old config
-- Ctrl+Super+arrows are reclaimed for monitor management below
hl.unbind("CTRL + SUPER + Right")
hl.unbind("CTRL + SUPER + Left")
hl.unbind("CTRL + SUPER + Up")
hl.unbind("CTRL + SUPER + Down")
-- workspace m+1/m-1 (was commented out)
hl.unbind("CTRL + SUPER + ALT + Right")
hl.unbind("CTRL + SUPER + ALT + Left")
-- workspace -1/+1 via brackets (was commented out)
hl.unbind("CTRL + SUPER + BracketLeft")
hl.unbind("CTRL + SUPER + BracketRight")
-- workspace focus via Page_Up/Down (was commented out)
hl.unbind("SUPER + Page_Down")
hl.unbind("SUPER + Page_Up")
hl.unbind("CTRL + SUPER + Page_Down")
hl.unbind("CTRL + SUPER + Page_Up")
-- workspace focus via scroll (was commented out)
hl.unbind("SUPER + mouse_up")
hl.unbind("SUPER + mouse_down")
hl.unbind("CTRL + SUPER + mouse_up")
hl.unbind("CTRL + SUPER + mouse_down")

--##! Monitor management
-- Move current workspace to a monitor
hl.bind("CTRL + SUPER + Right", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor r"), { description = "Monitor: Move workspace right" })
hl.bind("CTRL + SUPER + Left",  hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor l"), { description = "Monitor: Move workspace left" })
hl.bind("CTRL + SUPER + Up",    hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor u"), { description = "Monitor: Move workspace up" })
hl.bind("CTRL + SUPER + Down",  hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor d"), { description = "Monitor: Move workspace down" })
-- hl.bind("CTRL + SUPER + ALT + code:10", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor eDP-1"),    { description = "Monitor: Move workspace to eDP-1" })
-- hl.bind("CTRL + SUPER + ALT + code:11", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor HDMI-A-1"), { description = "Monitor: Move workspace to HDMI-A-1" })
-- Focus a monitor
hl.bind("SUPER + ALT + Right", hl.dsp.exec_cmd("hyprctl dispatch focusmonitor r"), { description = "Monitor: Focus right" })
hl.bind("SUPER + ALT + Left",  hl.dsp.exec_cmd("hyprctl dispatch focusmonitor l"), { description = "Monitor: Focus left" })
hl.bind("SUPER + ALT + Up",    hl.dsp.exec_cmd("hyprctl dispatch focusmonitor u"), { description = "Monitor: Focus up" })
hl.bind("SUPER + ALT + Down",  hl.dsp.exec_cmd("hyprctl dispatch focusmonitor d"), { description = "Monitor: Focus down" })

--##! Screenshots (restore Print-key layout)
-- Upstream rebinds Print → fullscreen and Ctrl+Print → screenshot+file; undo those
hl.unbind("Print")
hl.unbind("CTRL + Print")

-- Print → region screenshot
hl.bind("Print", hl.dsp.global("quickshell:regionScreenshot"), { description = "Utilities: Screen snip" })
hl.bind("Print", hl.dsp.exec_cmd(qsIsAlive .. " || pidof slurp || hyprshot --freeze --clipboard-only --mode region --silent"))

-- Shift+Print → Google Lens
hl.bind("SHIFT + Print", hl.dsp.global("quickshell:regionSearch"), { description = "Utilities: Google Lens" })
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(qsIsAlive .. " || pidof slurp || " .. hyprScripts .. "/snip_to_search.sh"))

-- Ctrl+Print → OCR
hl.bind("CTRL + Print", hl.dsp.global("quickshell:regionOcr"), { description = "Utilities: Character recognition >> clipboard" })
hl.bind("CTRL + Print", hl.dsp.exec_cmd(
    qsIsAlive ..
    " || pidof slurp || grim -g \"$(slurp $SLURP_ARGS)\" \"/tmp/ocr_image.png\" && tesseract \"/tmp/ocr_image.png\" stdout -l $(tesseract --list-langs | awk 'NR>1{print $1}' | tr '\\\\n' '+' | sed 's/\\\\+$/\\\\n/') | wl-copy && rm \"/tmp/ocr_image.png\""
))

-- Super+Print → fullscreen screenshot to clipboard (no monitor filter)
hl.bind("SUPER + Print", hl.dsp.exec_cmd("grim - | wl-copy"),
    { locked = true, description = "Utilities: Screenshot >> clipboard" })

-- Super+Ctrl+Print → fullscreen screenshot to file + clipboard (no monitor filter)
hl.bind("SUPER + CTRL + Print", hl.dsp.exec_cmd(
    "mkdir -p $(xdg-user-dir PICTURES)/Screenshots && " ..
    "grim $(xdg-user-dir PICTURES)/Screenshots/Screenshot_\"$(date '+%Y-%m-%d_%H.%M.%S')\".png"
), { locked = true, non_consuming = true, description = "Utilities: Screenshot >> clipboard & file" })
hl.bind("SUPER + CTRL + Print", hl.dsp.exec_cmd("grim - | wl-copy"), { locked = true, non_consuming = true })

--##! Hardware keys
hl.bind("XF86WebCam",        hl.dsp.exec_cmd("sudo webcam-control toggle -w \"USB2.0 FHD UVC WebCam\""), { locked = true })
hl.bind("XF86TouchpadToggle", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/touchpad.sh"),                { locked = true })
hl.bind("XF86Calculator",    hl.dsp.exec_cmd("gnome-calculator"))
hl.bind("XF86Launch1",       hl.dsp.exec_cmd("feishin --ozone-platform-hint=auto"))

--##! Lid Control
hl.bind("switch:on:Lid Switch",  hl.dsp.exec_cmd("hyprctl keyword monitor \"eDP-1, disable\""),
    { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd(
    "hyprctl keyword monitor \"eDP-1, 2880x1620@120, 0x0, 1.5\" && killall ags ydotool; ags &"),
    { locked = true })

--##! Vicinae
-- Unbind upstream launcher / overview that would conflict
hl.unbind("SUPER + SUPER_L")
hl.unbind("SUPER + SUPER_R")
hl.unbind("SUPER_L")
hl.unbind("SUPER_R")
hl.unbind("SUPER + Tab")
-- Unbind upstream clipboard / emoji binds replaced by Vicinae
hl.unbind("SUPER + V")
hl.unbind("SUPER + Period")

hl.bind("SUPER + R",        hl.dsp.exec_cmd("vicinae toggle"),                                     { description = "Toggle Vicinae" })
hl.bind("SUPER + V",        hl.dsp.exec_cmd("vicinae vicinae://launch/clipboard/history"),          { description = "Utilities: Clipboard history (Vicinae)" })
hl.bind("CTRL + SUPER + E", hl.dsp.exec_cmd("vicinae vicinae://launch/files/search"),               { description = "Utilities: File search (Vicinae)" })
hl.bind("SUPER + Period",   hl.dsp.exec_cmd("vicinae vicinae://launch/core/search-emojis"),         { description = "Utilities: Emoji search (Vicinae)" })

--##! Send to workspace (restore Super+Shift+1-0)
-- Upstream changed this to Super+Alt+code:N; restore the old Shift-based layout
for i = 1, 10 do
    local numberkey = { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 }
    hl.bind("SUPER + SHIFT + code:" .. numberkey[i], function()
        hl.dispatch(hl.dsp.window.move({ workspace = workspace_in_group(i), follow = false }))
    end)
end
