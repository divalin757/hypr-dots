#!/bin/bash

while true; do
  DANGLOWBAT=" 5"
  CRITLOWBAT=" 15"
  CRITHIGHBAT=" 95"
  LOW_BATTERY=" 30"
  HIGH_BATTERY=" 85"
  MHIGH_BATTERY=" 80"
  BATCMD=$(acpi | awk -F'[,%]' '{print $2}')

  if [[ $BATCMD == $LOW_BATTERY ]]; then
    notify-send -u critical "⚠️ Low Battery" "Battery reached$LOW_BATTERY% Plug in charger."
  fi
  if [[ $BATCMD == $HIGH_BATTERY ]]; then
    notify-send -u normal "🔋 High Battery" "Battery is at$HIGH_BATTERY% You can unplug the charger."
  fi
  if [[ $BATCMD == $MHIGH_BATTERY ]]; then
    notify-send -u normal "🔋 High Battery" "Battery is at$MHIGH_BATTERY% You can unplug the charger."
  fi
  if [[ $BATCMD == $CRITLOWBAT ]]; then
    notify-send -u critical "⚠️ Super Low Battery" "Battery reached$LOW_BATTERY% Plug in charger immediately"
  fi
  if [[ $BATCMD == $DANGLOWBAT ]]; then
    notify-send -u critical "⚠️💀💀 Low Battery" "Battery reached$DANGLOWBAT% Plug in charger or else you die"
  fi
  if [[ $BATCMD == $CRITHIGHBAT ]]; then
    notify-send -u normal "🔋 High Battery" "Battery is at$CRITHIGHBAT% You nedd to unplug the charger immediately"
  fi
  sleep 30
done
