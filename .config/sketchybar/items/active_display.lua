local icons = require("icons")

local active_display = sbar.add("item", "active_display", {
	position = "left",
	icon = {
		string = icons.wifi.upload,
	},
	label = {
		color = colors.text,
		string = "0",
		font = "SF Pro:Expanded Regular:11.0",
	},
	height = 12,
	background = { color = colors.transparent, border_color = colors.transparent },
})

active_display:subscribe({ "system_woke", "display_change" }, function(env)
	sbar.exec()
end)
