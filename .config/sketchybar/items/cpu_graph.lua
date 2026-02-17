-- == CPU GRAPH == 

local colors = require("colors")

local cpu_graph = sbar.add("graph", "cpu_graph", 40, {
	position = "right",
	graph = {
		color = colors.light_blue,
		fill_color = colors.transparent,
		line_width = 1.5,
	},
	background = {
		color = colors.transparent,
		height = 30, 
		border_color = colors.transparent,
	},
	update_freq = 1,
})

-- Draw the graph
cpu_graph:subscribe("system_stats", function(env)
	local cpu_value = tonumber(env.CPU_USAGE:match("(%d+)")) / 100
	cpu_graph:push({ cpu_value })
end)
