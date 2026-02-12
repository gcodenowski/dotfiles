-- == WiFi ==
local icons = require("icons")
local colors = require("colors")

local wifi_up = sbar.add("item", "wifi_up", {
  position = "left",
  icon = {
    string = icons.wifi.upload,
    font = "SF Pro:Expanded Bold:11.0", 
    padding_right = 2,
    padding_left = 15,
  },
  label = {
    color = colors.text,
    string = "0",
  },
  height = 12,
  background = { color = colors.transparent, border_color = colors.transparent }, 

})

local wifi_down = sbar.add("item", "wifi_down", {
  position = "left",
  icon = {
    string = icons.wifi.download,
    font = "SF Pro:Expanded Bold:11.0", 
   padding_right = 2,
  },
  label = {
    color = colors.text,
    string = "0",
  },
  height = 12,
  background = { color = colors.transparent, border_color = colors.transparent }, 
})

-- Update both from system_stats
wifi_up:subscribe("system_stats", function(env)
  local tx = env.NETWORK_TX_en0 or "0"
  local rx = env.NETWORK_RX_en0 or "0"

  wifi_up:set({ label = { string = tx } })
  wifi_down:set({ label = { string = rx } })
end)

