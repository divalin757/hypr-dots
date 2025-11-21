#!/bin/sh
# start-walker.sh
# Keep the GApplication alive for a moment so Hyprland doesn't kill it
/usr/bin/walker --gapplication-service &
sleep 2
