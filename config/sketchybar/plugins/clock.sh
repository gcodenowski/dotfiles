#!/bin/bash

# == Clock == 
sketchybar --add item clock right \
           --set clock update_freq=1 \
                 script='sketchybar --set $NAME label="$(date "+%H:%M:%S")"' \
                 icon=􀐫  \
                 label.width=70 \
		 padding_left=0  \
	         icon.y_offset=0
