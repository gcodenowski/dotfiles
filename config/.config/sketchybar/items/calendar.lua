local colors = require("colors")
local settings = require("settings")
local icons = require("icons")

local calendar = sbar.add("item", "calendar", {
	position = "right",
	icon = {
		string = icons.calendar,
	},
	label = {
		width = 85,
	},
	update_freq = 30,

	-- Open calendar app on mouse click
	click_script = "open -a 'Calendar'",
})

-- Calendar update logic, refresh on system wake, forced refresh and update_freq
calendar:subscribe({
	"forced",
	"routine",
	"system_woke",
	},
	function(env)
		calendar:set({icon = os.date("%a. %d %b.")})
	end)
