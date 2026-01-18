#!/bin/bash

# === CPU ===

# Colours config file
source "$CONFIG_DIR/colors.sh" # Loads defined colours

# Text
sketchybar --add item cpu right \
           --set cpu icon=􀯐 \
		     script='sketchybar --set cpu label="$CPU_USAGE"' \
		     label.width=47 \
		     padding_left=0 \
		     padding_right=0 \
		     background.border_color=$CLEAR

sketchybar --subscribe cpu system_stats

# Graph
sketchybar --add graph cpu_graph right 40 \
           --set cpu_graph graph.color=$LABEL_COLOR \
                           graph.fill_color=0x0000000 \
                           graph.line_width=1.5 \
                           background.height=30 \
                           background.corner_radius=10 \
                           y_offset=0 \
                           update_freq=1 \
                           script="$PLUGIN_DIR/cpu_graph.sh" \
           --subscribe cpu_graph system_stats
