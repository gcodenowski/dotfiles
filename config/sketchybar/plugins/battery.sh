#!/bin/sh

# Colours config file
source "$CONFIG_DIR/colors.sh" # Loads defined colours

# === Battery === 
sketchybar --add item battery right \
           --set battery update_freq=60 \
                 script="$HOME/.config/sketchybar/plugins/battery.sh" \
                 label.width=52 \
		 background.border_color=%CLEAR \
		 padding_left=0 \
  		 padding_right=0 \	
           --subscribe battery system_woke power_source_change \


# === Logic ===
PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON="􀛨"
  ;;
  [6-8][0-9]) ICON="􀺸"
  ;;
  [3-5][0-9]) ICON="􀺶"
  ;;
  [1-2][0-9]) ICON="􀛩"
  ;;
  *) ICON="􀛪"
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="􀢋"
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
