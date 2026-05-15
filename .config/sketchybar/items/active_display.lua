local icons = require("icons")

local active_display = sbar.add("item", "active_display", {
	position = "left",
	icon = {
		string = icons.wifi.upload,
		font = "SF Pro:Expanded Bold:11.0",
		padding_right = 2,
		padding_left = 10,
	},
	label = {
		color = colors.text,
		string = "0",
		font = "SF Pro:Expanded Regular:11.0",
	},
	height = 12,
	background = { color = colors.transparent, border_color = colors.transparent },
})
