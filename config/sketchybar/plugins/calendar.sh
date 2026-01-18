#!/bin/bash

# == Calendar ==
# Clickable calendar

sketchybar --add item calendar right \
           --set calendar update_freq=3600 \
                 script='sketchybar --set $NAME label="$(date "+%a %d %b")"' \
                 icon=􀉉 \
                 label.width=90 \
		 click_script="open -a 'Calendar'" \
