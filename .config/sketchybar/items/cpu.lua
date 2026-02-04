-- == CPU == 

local icons = require("icons")
local colors = require("colors")

local cpu = sbar.add("item", "cpu", {
	position = "right",
	icon = { string = icons.meter, },
	label = { width = 35 },
	background = { color = colors.transparent, border_color = colors.transparent }
})

-- Subscribe to cpu usage and display it
cpu:subscribe("system_stats", function(env)
	cpu:set({ label = env.CPU_USAGE })
end)

