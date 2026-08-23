local colors = require("colors")

-- Equivalent to the --bar domain
local bar_config = {
	position = "top",
	height = 36,
	blur_radius = 6,
	color = colors.bar,
	sticky = true,
	shadow = false,
	padding_left = 11,
	padding_right = 11,
	font_smoothing = true,
}

if colors.bar_overrides then
	for k, v in pairs(colors.bar_overrides) do
		bar_config[k] = v
	end
end

sbar.bar(bar_config)
