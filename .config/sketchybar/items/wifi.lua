-- == WiFi ==

local icons = require("icons")

-- WiFi item
local wifi = sbar.add("item", "wifi", {
	position = "left",
	update_freq = 10,
	label = {
		width = 1,
		drawing = "off",
	},
	click_script = "open /System/Library/PreferencePanes/Network.prefPane",
	padding_left = 12,
	icon = {
		padding_right = 6,
		font = { size = 14.0 },
	},
})

-- Subscribing to the WiFi status
wifi:subscribe({ "system_woke", "routine", "wifi_change" }, function(env)
	sbar.exec("ipconfig getifaddr en0", function(info)
		print(info)
		local connected = info:match("%d+%.%d+%.%d+%.%d+")
		local icon = icons.wifi.connected

		if connected then
			icon = icons.wifi.connected
		else
			icon = icons.wifi.disconnected
		end

		wifi:set({
			icon = { string = icon },
		})
	end)
end)
