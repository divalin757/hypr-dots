#!/bin/bash
if pgrep -x "swaync" >/dev/null; then
  killall -q swaync
fi
swaync &
if pgrep -x "waybar" >/dev/null; then
  killall -q waybar
fi
waybar &
