-- == UPTIME == 

local colors = require("colors")
local icons = require("icons")

local uptime = sbar.add("item", "uptime", {
	position = "center",
	icon = { string = icons.sun, padding_left = 8 },
	label = { padding_right = 10, },
	update_freq = 60,
})


uptime:subscribe("system_stats", function(env)
	uptime:set({ label = env.UPTIME })
end)
