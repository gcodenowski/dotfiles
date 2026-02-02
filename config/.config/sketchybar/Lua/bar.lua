local colors = require("colors")

-- Equivalent to the --bat domain

sbar.bar({
	position = top,
	height = 36,
	blur_radius = 20,
	color = colors.bar,
	sticky = on,
	shadow = on, 
	corner_radius = 10,
	padding_left = 4,
	padding_right = 4
})
