#!/bin/bash

# Get current metadata
title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

# Check if something is playing
status=$(playerctl status 2>/dev/null)

if [[ "$status" == "Playing" || "$status" == "Paused" ]]; then
  echo "   $artist - $title"
else
  echo "   no media playing"
fi
