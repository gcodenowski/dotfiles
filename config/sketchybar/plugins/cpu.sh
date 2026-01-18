#!/bin/bash
echo "CPU plugin executed at $(date)" >> /tmp/sketchybar_debug.log

# === CPU ===
sketchybar --add item cpu right \
           --set cpu icon=􀧓 \
		     script='sketchybar --set cpu label="$CPU_USAGE"' \ 
		     label.width=80
	
sketchybar --subscribe cpu system_stats
