#!/bin/sh

# == Front App ==
sketchybar --add item frontapp left \


# === Logic ===
if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" label="$INFO"
fi
