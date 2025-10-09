#!/bin/bash

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Bold and Underlined Text
BOLD='\033[1m'
UNDERLINE='\033[4m'

# Background Colors
BG_BLACK='\033[40m'
BG_RED='\033[41m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
BG_BLUE='\033[44m'
BG_MAGENTA='\033[45m'
BG_CYAN='\033[46m'
BG_WHITE='\033[47m'

# High Intensity (Bright) Colors
BRIGHT_BLACK='\033[0;90m'
BRIGHT_RED='\033[0;91m'
BRIGHT_GREEN='\033[0;92m'
BRIGHT_YELLOW='\033[0;93m'
BRIGHT_BLUE='\033[0;94m'
BRIGHT_MAGENTA='\033[0;95m'
BRIGHT_CYAN='\033[0;96m'
BRIGHT_WHITE='\033[0;97m'

# Bold High Intensity Colors
BOLD_BRIGHT_BLACK='\033[1;90m'
BOLD_BRIGHT_RED='\033[1;91m'
BOLD_BRIGHT_GREEN='\033[1;92m'
BOLD_BRIGHT_YELLOW='\033[1;93m'
BOLD_BRIGHT_BLUE='\033[1;94m'
BOLD_BRIGHT_MAGENTA='\033[1;95m'
BOLD_BRIGHT_CYAN='\033[1;96m'
BOLD_BRIGHT_WHITE='\033[1;97m'

# Reset Code
RESET='\033[0m'

updatenum=$(checkupdates | wc -l)
updateconf=("sudo pacman -Syu")
aurupdate=("yay -Syu")
var1="ip scanner"
var2="ping ip"
var3="remote desktop"
var4="geolocation "
var5="arp spoofer"
var6="quit the hacka program?"
#eval "$aurupdate"
#eval "$updateconf"

clear

while true; do
  echo -e "                             $GREEN$banner$RESET"
  echo -e "                                           $BLUE"there are "$updatenum" updates available"$RESET\n"
  echo -e "                                           1 $BLUE$var2$RESET"
  echo -e "                                           2 $BLUE$var2$RESET"
  echo -e "                                           3 $BLUE$var3$RESET"
  echo -e "                                           4 $BLUE$var4$RESET"
  echo -e "                                           5 $BLUE$var5$RESET"
  echo -e "                                           q $RED$var6$RESET"

  read -n 1 -s key

  # Actions based on key pressed
  case $key in
  1)
    eval "$updateconf"
    clear
    ;;
  2)
    ping_ip
    clear
    ;;
  3)
    remote_desktop
    sleep 3
    clear
    ;;
  4)
    geolocation
    sleep 6
    clear
    ;;
  5)
    echo -e "arp spoofers are ilegal btw (i use arch btw) :)"
    arpspoofer
    ;;
  6)
    echo -e "\nYou pressed '6' - Action 6"
    ;;
  7)
    echo -e "\nYou pressed '7' - Action 7"
    ;;
  8)
    echo -e "\nYou pressed '8' - Action 8"
    ;;
  :)
    popup_cmd
    ;;
  q)
    echo -e "\nDont worry you can always come back to the hacka program and hack some noobs"
    break # Exit the loop
    ;;
  $'\x0c') # Ctrl+L (ASCII code 0x0c) for clearing the screen
    echo -e "\nYou pressed 'Ctrl+L' - Clearing the screen"
    clear
    ;;
  *)
    echo -e "\nInvalid key. Press a number from '1' to '8', or 'q' to quit."
    ;;
  esac
  sleep 0.1
done
