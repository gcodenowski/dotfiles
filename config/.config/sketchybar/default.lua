local colors = require("colors")
local settings = require("settings")

-- Equivalent to the --default domain
sbar.default({
	padding_left = 2,
	padding_right = 2,

	icon = {
		font = "SF Pro:Bold:17.0",
		color = colors.light_blue,		
		padding_left = 6,
		padding_right = 0,
		y_offset = 1,
	},

	label = {
		font = "SF Pro:Bold:16.0",
		color = colors.text,
		padding_left = 4,
		padding_right = 4,
	},

	background = {
		corner_radius = 5,
		color = colors.bg,
		height = 30,
		border_color = colors.border,
		border_width = 1,
	},
})
