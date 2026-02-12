-- == FRONT APP == 

local frontapp = sbar.add("item", "frontapp", {
  position = "left",
  script = "$PLUGIN_DIR/front_app_switched.sh",
  label = { padding_right = 7 },
  icon = {
    background = {
      drawing = true,
      image = {
        scale = 0.3,
	padding_left = 3,
      }
    }
  }
})

frontapp:subscribe("front_app_switched", function(env)
local app_name = env.INFO or "unknown"
frontapp:set({
    label = { string = app_name },
    icon = {
      background = {
        image = { string = "app." .. app_name }
      }
    }
})
end)
