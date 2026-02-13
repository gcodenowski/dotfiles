local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	position = "top",
	height = 40,
	blur_radius = 40,
	color = colors.bar,
	sticky = true,
	shadow = true, 
	padding_left = 8,
	padding_right = 9,
	font_smoothing = true,
})
