#!/bin/bash

# === CPU ===
sketchybar --add item cpu right \
           --set cpu icon=􀧓 \
		     script='sketchybar --set cpu label="$CPU_USAGE"' \
		     label.width=47 \
		     padding_left=1 \
		     padding_right=0

sketchybar --subscribe cpu system_stats
