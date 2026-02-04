local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	position = "top",
	height = 36,
	blur_radius = 35,
	color = colors.bar,
	sticky = true,
	shadow = true, 
	padding_left = 4,
	padding_right = 4,
	font_smoothing = true,
})
