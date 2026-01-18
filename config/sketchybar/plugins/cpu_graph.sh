#!/bin/bash

# Remove % sign and convert to 0-1 scale (graph expects 0.0 to 1.0)
CPU_VALUE=$(echo "$CPU_USAGE" | tr -d '%')
NORMALIZED=$(echo "scale=2; $CPU_VALUE / 100" | bc)

# Push the value to the graph
sketchybar --push cpu_graph "$NORMALIZED"
