#!/bin/bash

# Set your trigger level here (20 for real use)
threshold=21

while true; do
  # Get current stats
  battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
  status=$(cat /sys/class/power_supply/BAT0/status)

  # If battery is low AND we are draining power
  if [ "$battery_level" -le "$threshold" ] && [ "$status" = "Discharging" ]; then

    # 1. Play the alarm
    paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga &

    # 2. Send the visual warning
    notify-send -u critical "LOW BATTERY" "Level: ${battery_level}% - PLUG IN NOW!"

    # 3. Wait exactly 30 seconds before checking/alarming again
    sleep 30

  else
    # If battery is fine or currently charging, relax and check again in 1 minute
    sleep 60
  fi
done
