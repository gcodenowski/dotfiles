local colors = require("colors")
local settings = require("settings")

-- This is for changing the defaults with os_theme
local function merge(base, overrides)
	if not overrides then
		return base
	end
	for k, v in pairs(overrides) do
		if type(v) == "table" and type(base[k]) == "table" then
			merge(base[k], v)
		else
			base[k] = v
		end
	end
	return base
end

-- Equivalent to the --default domain
local defaults = {
	padding_left = 2,
	padding_right = 2,

	icon = {
		font = "SF Pro:Bold:17.0",
		color = colors.accent,
		padding_left = 4,
		padding_right = 4,
		y_offset = 1,
	},

	label = {
		font = "SF Pro:Semibold:12.5",
		color = colors.text,
		padding_left = 4,
		padding_right = 4,
	},

	background = {
		corner_radius = 8,
		color = colors.bg,
		height = 30,
		border_color = colors.border,
		border_width = 1,
	},
}

-- Per-theme item styling (e.g. flatter, borderless for El Capitan).
if colors.default_overrides then
	merge(defaults, colors.default_overrides)
end

sbar.default(defaults)
