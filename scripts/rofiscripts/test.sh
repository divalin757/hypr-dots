#!/bin/bash

WALLPAPER_DIR=/home/divalin/.config/backgrounds/

WALL=$(exa --oneline --icons=always  $WALLPAPER_DIR |rofi -dmenu -p "select a wallpaper")
wall2=$(echo $WALL |cut -c 5- )
swww img --transition-type=grow --transition-fps=60 --transition-duration=1 $WALLPAPER_DIR/$wall2

if [[ $WALL == "" ]]; then
   notify-send "no wallpaper selected"		
else 
   notify-send "selected $WALL"
fi 

