#!/bin/bash

# === RAM ===
sketchybar --add item ram right \ 
           --set ram script="sketchybar --set cpu label=\$RAM_USAGE" \ 
	  	     icon=􀫦  \
           --subscribe ram system_stats \ 

# === Logic ===
