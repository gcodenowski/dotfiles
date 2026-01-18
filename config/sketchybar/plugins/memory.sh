#!/bin/bash

# === RAM ===
sketchybar --add item memory right \
           --set memory icon=􀫦 \
		        script='sketchybar --set memory label="$RAM_USAGE"' \
		        label.width=47 \
		        padding_left=0 \
			padding_right=1


sketchybar --subscribe memory system_stats
