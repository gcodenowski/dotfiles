-- Path to SbarLua installation
package.cpath = package.cpath .. ";/Users/" .. os.getenv("USER") .. "/.local/share/sketchybar_lua/?.so"

local sbar = require("sketchybar")

CONFIG_DIR = os.getenv("HOME") .. "/.config/sketchybar"
PLUGIN_DIR = CONFIG_DIR .. "/plugins_lua"

-- == Config Modules ==
require("bar")

