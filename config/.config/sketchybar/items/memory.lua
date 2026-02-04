-- == RAM ==

local icons = require("icons")

local memory = sbar.add("item", "memory", {
	position = "right",
	icon = { string = icons.memory },
	label = { width = 55 },
})

-- Subscribe to RAM and display available memory
memory:subscribe("system_stats", function(env)
	memory:set({ label = env.RAM_AVAILABLE })
end)
