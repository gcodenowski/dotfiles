#!/bin/bash

# Colours config file
source "$CONFIG_DIR/colors.sh" # Loads defined colours

# === Menu ===
# Apple menu logo with child popup items
# Each item executes an action and disables popup drawing after execution

sketchybar --add item menu left \
           --set menu icon=􀣺\
		      icon.color=$OFF_WHITE \
		      icon.padding_left=7 \
		      icon.padding_right=9 \
		      label.drawing=off  \
		      click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
                      popup.background.border_width=2                                \
                      popup.background.corner_radius=3                                \
                      popup.background.border_color=0xff9dd274                        \
	   --default background.padding_left=5                                             \
                      background.padding_right=5                                            \
                      icon.padding_right=5                                                  \
                      icon.font="SF Pro:Bold:16.0"                                          \
                      label.font="SF Pro:Semibold:13.0"                		            \
		      label.padding_right=10  \
											\
	   --add item menu.preferences popup.menu  \
	   --set menu.preferences icon=􀣋 \
		 	          label=Preferences \
 				  click_script="open -a 'System Preferences';
					        sketchybar -m --set menu popup.drawing=off" \
	   --add item menu.lock popup.menu \
	   --set menu.lock icon=􀼓 \
	   	           label=Lock \
			   click_script="pmset displaysleepnow;
					 sketchybar -m --set menu popup.drawing=off" \
	   --add item menu.about popup.menu \
	   --set menu.about icon=􀁜 \
			    label="About This Mac" \
	   		    click_script="open 'x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension';
				         sketchybar -m --set menu popup.drawing=off" \
	   --add item menu.system popup.menu \
	   --set menu.system icon=􀱢 \
			     label="System" \
			     click_script="open -a 'System Information';
					   sketchybar -m --set menu popup.drawing=off" \
