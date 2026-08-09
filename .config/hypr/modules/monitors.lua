------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
  output = "eDP-1",
  mode = "1920x1200@60",
  position = "0x0",
  scale = 1,
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "3440x1440@100",
  -- mode = "1760x1440@100",
  position = "1920x0",
  scale = 1,
})
