local colors = require("colors")
local icons = require("icons")

-- Main menu item
local menu = sbar.add("item", "apple", {
	position = "left",
	icon = {
		string = icons.apple,
		color = colors.text,
		padding_left = 7,
		padding_right = 9,
	},
	label = { drawing = false },
	click_script = "sketchybar -m --set apple popup.drawing=toggle",
	popup = {
		background = {
			border_width = 2,
			corner_radius = 3,
			border_color = colors.border,
		},
	},
})

-- Popup items

-- Preferences
local preferences = sbar.add("item", "apple.preferences", {
	position = "popup.apple",
	icon = { string = icons.gear }, -- Preferences icon
	label = { string = "Preferences" },
	click_script = "open -a 'System Preferences'; sketchybar -m --set apple popup.drawing=off",
})

-- Lock
local lock = sbar.add("item", "apple.lock", {
	position = "popup.apple",
	icon = { string = icons.lock },
	label = { string = "Lock" },
	click_script = "pmset displaysleepnow; sketchybar -m --set apple popup.drawing=off",
})

-- About this mac
local about = sbar.add("item", "apple.about", {
	position = "popup.apple",
	icon = { string = icons.about },
	label = { string = "About This Mac" },
	click_script = "open 'x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension'; sketchybar -m --set apple popup.drawing=off",
})

-- System Info
local system = sbar.add("item", "apple.system", {
	position = "popup.apple",
	icon = { string = icons.specs },
	label = { string = "System Info" },
	click_script = "open -a 'System Information'; sketchybar -m --set apple popup.drawing=off",
})

-- Power off
local shutdown = sbar.add("item", "apple.shutdown", {
	position = "popup.apple",
	icon = { string = icons.power },
	label = { string = "Shutdown" },
	click_script = "osascript -e 'tell app\"System Events\" to shut down'",
})
