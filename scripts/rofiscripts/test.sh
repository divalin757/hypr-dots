#!/bin/bash

WALLPAPER_DIR=/home/divalin/.config/backgrounds/

WALL=$(exa --oneline  $WALLPAPER_DIR |rofi -dmenu -p "select a wallpaper")
# swww img --transition-type=grow --transition-fps=60 --transition-duration=1 $WALLPAPER_DIR/$WALL
swww img --transition-type=wipe --transition-fps=60 --transition-duration=1 $WALLPAPER_DIR/$WALL

if [[ $WALL == "" ]]; then
   notify-send "no wallpaper selected"		
else 
   notify-send "selected $WALL"
fi 

