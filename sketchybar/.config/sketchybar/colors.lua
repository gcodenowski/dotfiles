local theme = os.getenv("SKETCHY_THEME")
if not theme then
	local f = io.open(os.getenv("HOME") .. "/.config/sketchybar/.theme")
	if f then
		theme = f:read("*l")
		f:close()
	end
end
theme = (theme and theme ~= "") and theme or "aurora"

return require("themes." .. theme)
