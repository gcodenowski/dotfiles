local icons = require("icons")
local colors = require("colors")

local active_display = sbar.add("item", "active_display", {
	position = "right",
	icon = {
		string = icons.display.main,
		font = "SF Pro:Expanded Regular:13.0",
	},
	label = {
		color = colors.text,
		font = "SF Pro:Expanded Regular:11.0",
		padding_right = 10,
	},
	height = 12,
	background = { color = colors.transparent, border_color = colors.transparent },
})

active_display:subscribe({ "system_woke", "display_change" }, function(env)
	local display = tonumber(env.INFO) or 2
	local icon
	local label

	if display == 2 then
		icon = icons.display.main
		label = '14"'
	elseif display == 1 then
		icon = icons.display.large
		label = '24"'
	end

	active_display:set({
		icon = { string = icon },
		label = { string = label },
	})
end)
