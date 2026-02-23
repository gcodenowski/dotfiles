local colors = require("colors")

for i = 1, 10 do
	sbar.add("space", "space" .. i, {
		position = left,
		width = 30,
		space = i,
		icon = {
			padding_left = 10,
			padding_right = 12,
			string = i,
			color = colors.inactive,
			highlight_color = colors.light_blue,
			font = "SF Pro:Expanded Bold:14",
		},
		label = { drawing = false },
		background = {
			drawing = false,
		},
	})
end
