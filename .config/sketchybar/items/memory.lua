-- == RAM ==

local icons = require("icons")
local colors = require("colors")

local memory = sbar.add("item", "memory", {
	position = "right",
	icon = { string = icons.memory },
	label = { width = 55 },
	background = { color = colors.transparent, border_color = colors.transparent }
})

-- Subscribe to RAM and display available memory
memory:subscribe("system_stats", function(env)
	memory:set({ label = env.RAM_AVAILABLE })
end)
