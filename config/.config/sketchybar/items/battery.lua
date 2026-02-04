-- == BATTERY == 

local icons = require("icons")
local settings = require("settings")

-- Battery item
local battery = sbar.add("item", "battery", {
  position = "right",
  update_freq = 60,
  label = { 
	  width = 1,
	  drawing = off,
  },
  click_script = "open 'x-apple.systempreferences:com.apple.Battery-Settings.extension'"
})

-- Subscribing to the battery event 
battery:subscribe({"system_woke", "power_source_change"}, function(env)
  sbar.exec("pmset -g batt", function(info)
    local found_percent, _, PERCENTAGE = info:find("(%d+)%%")
    local CHARGING = info:find("AC Power")
    
    if not found_percent then
      return -- exit 0 equivalent
    end
    
    PERCENTAGE = tonumber(PERCENTAGE)
    local icon = icons.battery._0 -- default
    
    if PERCENTAGE >= 90 or PERCENTAGE == 100 then
      icon = icons.battery._100 
    elseif PERCENTAGE >= 60 then
      icon = icons.battery._75
    elseif PERCENTAGE >= 30 then
      icon = icons.battery._50
    elseif PERCENTAGE >= 10 then
      icon = icons.battery._25
    end
    
    if CHARGING then
      icon = icons.battery.charging 
    end
    
    battery:set({
      icon = { string = icon }
    })
  end)
end)

