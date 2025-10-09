#!/bin/bash

OPTIONS="Logout\nReboot\nShutdown\nSuspend\nLock"

chosen=$(echo -e "$OPTIONS" | walker --dmenu --width 200 --height 250 --placeholder "Logout:")

case "$chosen" in
"Logout")
  hyprctl dispatch exit
  ;;
"Reboot")
  systemctl reboot
  ;;
"Shutdown")
  systemctl poweroff
  ;;
"Suspend")
  systemctl suspend
  ;;
"Lock")
  hyprlock
  ;;
*)
  echo "No valid option selected."
  ;;
esac
