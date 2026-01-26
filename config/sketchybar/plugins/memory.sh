#!/bin/bash
# === RAM ===

# Colours config file
source "$CONFIG_DIR/colors.sh" # Loads defined colours

sketchybar --add item memory right \
           --set memory icon=􀫦 \
		        script='sketchybar --set memory label="$RAM_USAGE"' \
		        label.width=42 \
		        padding_left=0 \
			padding_right=0 \
			background.border_color=$CLEAR


sketchybar --subscribe memory system_stats
