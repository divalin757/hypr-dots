#!/bin/bash

ans=$(echo -e "focus\nnormal" |rofi -dmenu -p "chooose a mode")

if [[ $ans == "focus" ]]; then
  hyprctl --batch keyword general:border_size 0
  hyprctl --batch keyword general:gaps_in 0
  hyprctl --batch keyword general:gaps_out 0
  killall waybar 
elif [[ $ans == "normal" ]]; then
  hyprctl --batch keyword general:border_size 2
  hyprctl --batch keyword general:gaps_in 5
  hyprctl --batch keyword general:gaps_out 8
  waybar & disown
fi


