local colors = require("colors")

local space = require("items.spaces")

local space_bracket = sbar.add("bracket", "spaces_bracket", {
	"space1",
	"space2",
	"space3",
	"space4",
	"space5",
	"space6",
	"space7",
	"space8",
	"space9",
	"space10",
}, { background = {
	height = 30,
	color = colors.bg,
	border_color = colors.border,
} })
