local colors = require("colors")
local icons = require("icons")

-- Main menu item
local menu = sbar.add("item", "apple", {
  position = "left",
  icon = {
    string = icons.apple, 
    color = colors.text,
    padding_left = 7,
    padding_right = 9
  },
  label = { drawing = false },
  click_script = "sketchybar -m --set apple popup.drawing=toggle",
  popup = {
    background = {
      border_width = 2,
      corner_radius = 3,
    }
  }
})

-- Popup items
local preferences = sbar.add("item", "apple.preferences", {
  position = "popup.apple",
  icon = { string = icons.gear },  -- Preferences icon
  label = { string = "Preferences" },
  click_script = "open -a 'System Preferences'; sketchybar -m --set apple popup.drawing=off"
})

local lock = sbar.add("item", "apple.lock", {
  position = "popup.apple",
  icon = { string = icons.lock },  -- Lock icon
  label = { string = "Lock" },
  click_script = "pmset displaysleepnow; sketchybar -m --set apple popup.drawing=off"
})

local about = sbar.add("item", "apple.about", {
  position = "popup.apple",
  icon = { string = icons.about },  -- Info icon
  label = { string = "About This Mac" },
  click_script = "open 'x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension'; sketchybar -m --set apple popup.drawing=off"
})

local system = sbar.add("item", "apple.system", {
  position = "popup.apple",
  icon = { string = icons.specs },  -- System icon
  label = { string = "System" },
  click_script = "open -a 'System Information'; sketchybar -m --set apple popup.drawing=off"
})

