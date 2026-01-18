#!/bin/bash

# == Calendar ==
sketchybar --add item calendar right \
           --set calendar update_freq=3600 \
                 script='sketchybar --set $NAME label="$(date "+%a %d %b")"' \
                 icon=􀉉 \
                 icon.y_offset=1 \
                 label.width=85 \
