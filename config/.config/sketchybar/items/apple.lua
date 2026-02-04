local colors = require("colors")
local icons = require("icons")
require("items.popup_defaults")


-- Main menu item
local menu = sbar.add("item", "menu", {
  position = "left",
  icon = {
    string = icons.apple, 
    color = colors.text,
    padding_left = 7,
    padding_right = 9
  },
  label = { drawing = false },
  click_script = "sketchybar -m --set $NAME popup.drawing=toggle",
  popup = {
    background = {
      border_width = 2,
      corner_radius = 3,
      border_color = colors.border,
    }
  }
})

-- Popup items
local preferences = sbar.add("item", "menu.preferences", {
  position = "popup.menu",
  icon = { string = "􀣋" },  -- Preferences icon
  label = { string = "Preferences" },
  click_script = "open -a 'System Preferences'; sketchybar -m --set menu popup.drawing=off"
})

local lock = sbar.add("item", "menu.lock", {
  position = "popup.menu",
  icon = { string = "􀼓" },  -- Lock icon
  label = { string = "Lock" },
  click_script = "pmset displaysleepnow; sketchybar -m --set menu popup.drawing=off"
})

local about = sbar.add("item", "menu.about", {
  position = "popup.menu",
  icon = { string = "􀁜" },  -- Info icon
  label = { string = "About This Mac" },
  click_script = "open 'x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension'; sketchybar -m --set menu popup.drawing=off"
})

local system = sbar.add("item", "menu.system", {
  position = "popup.menu",
  icon = { string = "􀱢" },  -- System icon
  label = { string = "System" },
  click_script = "open -a 'System Information'; sketchybar -m --set menu popup.drawing=off"
})

