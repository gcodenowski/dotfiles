#!/bin/bash

# == Clock == 
sketchybar --add item clock right \
           --set clock update_freq=1 \
                 script='sketchybar --set $NAME label="$(date "+%H:%M")"' \
                 icon=􀐫  \
                 label.width=50 \
		 padding_left=0  \
