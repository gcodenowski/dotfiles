local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	position = "top",
	height = 36,
	blur_radius = 30,
	color = colors.bar,
	sticky = true,
	shadow = false,
	padding_left = 11,
	padding_right = 11,
	font_smoothing = true,
})
