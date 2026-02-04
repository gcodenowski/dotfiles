-- == CPU == 

local colors = require("colors")
local icons = require("icons")

local cpu = sbar.add("item", "cpu", {
	position = "right",
	icon = {
		string = icons.brain,
	},
	label = {
		width = 39,
	},
})

-- Subscribe to cpu usage and display it
cpu:subscribe("system_stats", function(env)
	cpu:set({ label = env.CPU_USAGE })
end)

