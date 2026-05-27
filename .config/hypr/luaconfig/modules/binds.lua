---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local browser     = "zen-browser"
local fileManager = "nautilus"

local menu        = "pkill rofi || rofi -no-lazy-grab -show drun -modi drun -theme ~/.config/rofi/app-launcher.rasi"
local dmenu       = "pkill rofi || sh ~/.config/colorschemes/launcher.sh"
local wallpaper   = "pkill rofi || sh ~/scripts/wallpaper.sh"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "ALT" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitty -e yazi"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(dmenu))
--hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
--hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("sh ~/scripts/fastprobe.sh"))

-- My Apps
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(browser))

-- Move focus with mainMod + arrow keys
--hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
--hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
--hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
--hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--# Resize windows
--bind = $mainMod SUPER, l, resizeactive, 210 0
--bind = $mainMod SUPER, h, resizeactive, -210 0
--bind = $mainMod SUPER, k, resizeactive, 0 -210
--bind = $mainMod SUPER, j, resizeactive, 0 210
--
--# Move window
--bind = CTRL SUPER, H, swapwindow, l
--bind = CTRL SUPER, L, swapwindow, r
--bind = CTRL SUPER, K, swapwindow, u
--bind = CTRL SUPER, J, swapwindow, d

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind(mainMod .. " + CTRL + SPACE",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Groups
--bind = $mainMod, G, togglegroup # Agrupar / Desagrupar la ventana actual
--bind = ALT, tab, changegroupactive, f    # 'f' de forward (adelante)
--bind = ALT SHIFT, tab, changegroupactive, b  # 'b' de backward (atrás)
--bind = $mainMod SHIFT, G, moveoutofgroup
--
-- Notification
--bind = ALT, P, exec, swaync-client -t
--
-- Cipboard
--bind = ALT, V, exec, cliphist list | rofi -dmenu -display-columns 2 -p "Clipboard" -theme /home/hervert/.config/rofi/launcher.rasi | cliphist decode | wl-copy


-- Screenshot
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
--bind = $mainMod SHIFT, S, exec, grim -g "$(slurp)" - | swappy -f -
--ind = $mainMod SHIFT, S, exec, hyprshot -m region --clipboard-only
--bind = $mainMod SHIFT, S, exec, hyprshot -m region -o ~/Pictures/Screenshots

-- Zoomer wayland
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("grim - | wayland-boomer"))

-- Sowon
hl.bind(mainMod .. " + J", hl.dsp.exec_cmd(sowon))

-- bind = $mainMod SHIFT, S, exec, hyprshot -m region --clipboard-only
