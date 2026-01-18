#!/bin/sh

# == Front App ==
sketchybar --add item frontapp left \
           --set frontapp script="$PLUGIN_DIR/front_app.sh" \
  			  icon.background.drawing=on \
                          icon.background.image.scale=0.7 \
           --subscribe frontapp front_app_switched

# === Logic ===
if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" label="$INFO" \
			   icon.background.image="app.$INFO"
fi
