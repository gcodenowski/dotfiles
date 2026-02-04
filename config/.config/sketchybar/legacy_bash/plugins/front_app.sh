#!/bin/bash

# == Front App ==
sketchybar --add item frontapp left \
           --set frontapp script="$PLUGIN_DIR/front_app_switched.sh" \
  			  icon.background.drawing=on \
                          icon.background.image.scale=0.7 \
			  icon.background.image.padding_left=5 \
           --subscribe frontapp front_app_switched

