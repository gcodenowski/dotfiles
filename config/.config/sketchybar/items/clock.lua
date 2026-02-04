local icons = require("icons")
local colors = require("colors")

local clock = sbar.add("item", "clock", {
	position = "right",
	icon = {
		string = icons.clock,
	},
	label = { width=68 },
	update_freq = 1,
	padding_left = 0
})

clock:subscribe( function(env)
		clock:set({icon = os.date("%H:%M:%S")})
	end)
