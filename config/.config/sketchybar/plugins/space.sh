#!/bin/sh

# Loading colours
# source "$CONFIG_DIR/colors.sh"

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

# sketchybar --set "$NAME" background.drawing="$SELECTED"

#!/bin/bash

# Define spaces for each display
SPACES_DISPLAY_1=(1 2 3)
SPACES_DISPLAY_2=(4 5 6)

# Common properties
SCRIPT="$PLUGIN_DIR/space.sh"

# Function to add a space
add_space() {
  local space=$1
  local display=$2
  
  sketchybar --add space space.$space left \
             --set space.$space space=$space \
                                display=$display \
                                icon=$space \
				width=30 \
				label.width=0 \
                                script="$SCRIPT" \
             --subscribe space.$space space_change
}

# Add spaces for Display 1
for space in "${SPACES_DISPLAY_1[@]}"; do
  add_space "$space" 1
done

# Add spaces for Display 2
for space in "${SPACES_DISPLAY_2[@]}"; do
  add_space "$space" 2
done

