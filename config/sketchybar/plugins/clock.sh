#!/bin/bash

# == Clock == 
sketchybar --add item clock right \
           --set clock update_freq=1 \
                 script='sketchybar --set $NAME label="$(date "+%H:%M:%S")"' \
                 icon=􀐫  \
                 icon.y_offset=1 \
                 label.width=75 \
