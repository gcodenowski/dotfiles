local colors = require("colors")
local icons = require("icons")
local settings = require("settings")


local battery = sbar.add("item", {
	position = "right",
	update_freq = 60,
	label = {
		width = 2
	}
	padding_left = 0,
	padding_right = 0,
	click_script = "open 'x-apple.systempreferences:com.apple.Battery-Settings.extension'",
})

battery:subscribe({
	


