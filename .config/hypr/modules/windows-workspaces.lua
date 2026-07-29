--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name  = "suppress-maximize-events",
  match = { class = ".*" },

  suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name  = "fix-xwayland-drags",
  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move  = "20 monitor_h-120",
  float = true,
})

-- ---------------------------------------------------------------------- --

-- ----- GNS3 ----- --
hl.workspace_rule({ workspace = "special:magic", gaps_out = 50, gaps_in = 7 })

hl.window_rule({ --GNS3 GUI
  name = "GNS3",
  match = {
    class = "^(gns3)$"
  },
  workspace = "special:magic"
})

hl.window_rule({
  name = "kitty",
  match = {
    class = "kitty",
    workspace = "special:magic",
  },
  float = true,
  center = true,
  size = "(monitor_w*0.5) (monitor_h*0.5)",
})

-- Wireshark
hl.window_rule({
  name = "wireshark float in GNS3 labs",
  match = {
    class = "org%.wireshark%.Wireshark",
    workspace = "special:magic",
  },
  float = true,
  center = true,
  size = { "50%", "50%" }, -- o { 0.5, 0.5 } según prefieras
})

-- VNC Viewer (GNS3 VMs)
hl.window_rule({
  name = "floating VMs in GNS3",
  match = {
    class = "Vncviewer",
  },
  float = true,
  center = true,
})

--# ----- OBSIDIAN ----- #
--hl.workspace_rule({ workspace = "name:magic", gapsout = 50, gapsin = 7 }) 

hl.window_rule({
  name = "obsidian",
  match = {
    class = "obsidian",
  },
  workspace = "special:magic",
  animation = "popin",
})

-- ----- File picker for browser ----- --
hl.window_rule({
  name = "file picker in browser",
  match = {
    class = "xdg%-desktop%-portal%-gtk",
  },
  float = true,
  center = true,
  size = { "80%", "80%" },
})

-- ----- Nautilus ----- --
hl.window_rule({
  name = "nautilus",
  match = {
    class = "org.gnome.Nautilus",
  },
  float = true,
  --center = true,
  --size = { "90%", "90%" },
  size = {"(monitor_w*0.7)", "(monitor_h*0.7)"},
})

-- ----- Captura ----- --
hl.layer_rule({
  match = {
    namespace = "^hyprshot$",
  },
  no_anim = true,
})

hl.layer_rule({
  match = {
    namespace = "selection",
  },
  no_anim = true,
})

hl.layer_rule({
  match = {
    namespace = "swappy",
  },
  no_anim = true,
})

-- ----- Satty ----- --
hl.window_rule({
  name = "satty",
  match = {
    class = "com.gabm.satty$",
  },
  float = true,
  center = true,
  -- size = { "90%", "90%" },
  -- size = { "50%", "50%" },
})

-- ----- QuickShell ----- --
hl.window_rule({
  name = "launcher-quick",
  match = {
    class = "^org.quickshell$",
  },
  float = true,
  center = true,
  -- size = { "90%", "90%" },
  -- size = { "50%", "50%" },
})
