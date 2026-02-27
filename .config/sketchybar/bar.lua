local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	position = "top",
	height = 36,
	blur_radius = 40,
	color = colors.bar,
	sticky = true,
	shadow = true,
	padding_left = 11,
	padding_right = 11,
	font_smoothing = true,
})
