-- == CLOCK ==

local icons = require("icons")
local colors = require("colors")

local clock = sbar.add("item", "clock", {
	position = "right",
	icon = {
		string = icons.clock,
	},
	label = {
		width = 67,
	},
	update_freq = 1,

	-- Open clock app on mouse click
	click_script = "open -a 'Clock'",
})

clock:subscribe({ "routine" }, function(env)
	clock:set({
		icon = { string = icons.clock },
		label = { string = os.date("%H:%M:%S") },
	})
end)
