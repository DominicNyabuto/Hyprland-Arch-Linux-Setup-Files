#!/bin/bash

# Get the floating status of the active window
is_floating=$(hyprctl activewindow -j | jq '.floating')

if [ "$is_floating" == "true" ]; then
  # If it's ALREADY floating, just toggle it back to tiled (don't resize!)
  hyprctl dispatch togglefloating
else
  # If it's NOT floating, toggle it on, then resize and center
  hyprctl dispatch togglefloating
  hyprctl dispatch resizeactive exact 60% 60%
  hyprctl dispatch centerwindow
fi
