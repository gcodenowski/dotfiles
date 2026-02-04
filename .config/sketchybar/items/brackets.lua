local colors = require("colors")

local cpu = require("items.cpu")
local cpu_graph = require("items.cpu_graph")
local memory = require("items.memory")

local bracket = sbar.add("bracket", "stats_bracket", {
	"cpu",
	"cpu_graph",
	"memory",
},
{ background = {
	color = colors.bg_bracker,
	border_color = colors.transparent,
	}
})

