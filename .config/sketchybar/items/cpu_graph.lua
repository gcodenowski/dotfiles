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
		height = 30, 
	},
	y_offset = 0,
	update_freq = 1,
	-- drawing = true - I don't know if I need this yet
})

-- Draw the graph
cpu_graph:subscribe("system_stats", function(env)
	local cpu_value = tonumber(env.CPU_USAGE:match("(%d+)")) / 100
	cpu_graph:push({ cpu_value })
end)
